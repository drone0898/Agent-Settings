---
description: "Interactively install Claude Code hooks into settings files. Use this skill whenever the user wants to add, create, set up, or install hooks for Claude Code — whether they say 'add a hook', 'set up a pre-tool hook', 'block dangerous commands', 'validate bash commands', 'add a session hook', or anything related to configuring Claude Code event hooks in settings.json files."
---

# install-hook

사용자의 프로젝트에 Claude Code hook을 인터랙티브하게 설치하는 스킬입니다.

Hook은 Claude Code가 특정 이벤트(도구 실행, 세션 시작/종료 등)에 반응하여 스크립트를 실행하거나 검증을 수행하는 메커니즘입니다. 이 스킬은 사용자와 대화하며 적절한 hook을 구성하고, 올바른 settings 파일에 설치합니다.

---

## 실행 절차

### Step 1: 요구사항 수집

사용자에게 어떤 hook을 설치하고 싶은지 질문합니다. 다음 프리셋을 번호로 제시하세요:

```
어떤 hook을 설치할까요?

1. 위험한 bash 명령 차단 (rm -rf, git push --force 등)
2. 파일 쓰기 검증 (특정 경로 보호)
3. 세션 시작 시 컨텍스트 로드
4. 세션 종료 시 워크플로우 트리거
5. 커스텀 (직접 설정)
```

**프리셋 1 선택 시** → PreToolUse + Bash matcher + command 타입으로 진행
**프리셋 2 선택 시** → PreToolUse + "Edit|Write" matcher + command 타입으로 진행
**프리셋 3 선택 시** → SessionStart + "startup" matcher, 무엇을 로드할지 추가 질문
**프리셋 4 선택 시** → Stop + 빈 matcher, 어떤 워크플로우를 트리거할지 추가 질문
**프리셋 5 선택 시** → 이벤트, 매처, 동작을 각각 질문 (아래 레퍼런스 테이블 활용)

### Step 2: 설치 범위 선택

```
어디에 설치할까요?

1. 전역 (~/.claude/settings.json) — 이 컴퓨터의 모든 프로젝트에 적용
2. 프로젝트 공유 (.claude/settings.json) — 팀원과 공유 (커밋됨)
3. 로컬 전용 (.claude/settings.local.json) — 나만 사용 (gitignore)
```

대부분의 경우 **3번(로컬 전용)**을 권장합니다. 팀 전체에 적용할 규칙이라면 2번을 추천하세요.

### Step 3: 기존 설정 읽기

대상 settings 파일을 Read 도구로 읽습니다.
- 파일이 없으면 `{}` 빈 객체로 시작
- 파일이 있으면 기존 내용을 파싱하여 보존할 준비

### Step 4: Hook 설정 JSON 생성

선택된 이벤트와 매처에 맞는 hook 설정을 생성합니다:

```json
{
  "hooks": {
    "<EVENT>": [
      {
        "matcher": "<MATCHER>",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/<script-name>"
          }
        ]
      }
    ]
  }
}
```

핸들러 타입이 `prompt`나 `agent`인 경우 스크립트 대신 프롬프트를 직접 지정합니다:

```json
{
  "type": "prompt",
  "prompt": "<검증 프롬프트 내용>"
}
```

### Step 5: 스크립트 파일 생성 (command 타입일 때)

`.claude/hooks/` 디렉토리를 생성하고 (없으면), 스크립트 파일을 작성합니다.

**Bash 스크립트 템플릿:**
```bash
#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# 검증 로직
if echo "$COMMAND" | grep -qE '<DANGEROUS_PATTERN>'; then
  echo '{"decision": "block", "reason": "<차단 사유>"}'
else
  echo '{"decision": "approve"}'
fi
```

**Python 스크립트 템플릿:**
```python
#!/usr/bin/env python3
import json, sys, re

data = json.load(sys.stdin)
command = data.get("tool_input", {}).get("command", "")

if re.search(r'<DANGEROUS_PATTERN>', command):
    print(json.dumps({"decision": "block", "reason": "<차단 사유>"}))
else:
    print(json.dumps({"decision": "approve"}))
```

**파일 쓰기 검증용 템플릿 (Edit|Write):**
```bash
#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if echo "$FILE_PATH" | grep -qE '<PROTECTED_PATH_PATTERN>'; then
  echo '{"decision": "block", "reason": "보호된 경로입니다: '"$FILE_PATH"'"}'
else
  echo '{"decision": "approve"}'
fi
```

스크립트 작성 후 반드시 실행 권한을 부여합니다:
```bash
chmod +x .claude/hooks/<script-name>
```

시스템에 `jq`가 설치되어 있는지 확인하고, 없으면 Python 템플릿을 사용하세요.

### Step 6: 설정 머지 및 쓰기

기존 settings와 새 hook을 안전하게 머지합니다. 핵심 규칙:

1. 기존 `permissions`, `enabledPlugins` 등 다른 키는 그대로 유지
2. `hooks` 키가 없으면 새로 추가
3. 이벤트 키(예: `PreToolUse`)가 없으면 새 배열로 추가
4. 이벤트 키가 이미 있으면 배열에 새 항목을 **append** (덮어쓰기 금지)
5. 동일한 matcher + command 조합이 이미 있으면 중복 추가하지 않고, 이미 존재한다고 알림

Write 도구로 머지된 전체 JSON을 작성합니다 (2스페이스 인덴트).

### Step 7: 검증 및 안내

1. 작성된 settings 파일을 다시 Read하여 올바르게 저장되었는지 확인
2. 설치 결과를 사용자에게 요약 표시:
   - 설치된 hook 이벤트와 매처
   - 설치 위치 (어떤 settings 파일)
   - 생성된 스크립트 경로 (있는 경우)
3. 테스트 방법 안내:
   - PreToolUse/Bash hook → "위험한 명령을 입력해보세요 (예: `rm -rf /`)"
   - PreToolUse/Write hook → "보호된 경로에 파일 쓰기를 시도해보세요"
   - SessionStart hook → "새 세션을 시작해보세요"
   - Stop hook → "세션을 종료해보세요"

---

## Hook 이벤트 레퍼런스

| 이벤트 | 발생 시점 | matcher 값 | 용도 |
|--------|----------|-----------|------|
| `PreToolUse` | 도구 실행 전 | 도구 이름 (`Bash`, `Edit\|Write`, `mcp__.*`) | 명령 검증, 위험 차단 |
| `PostToolUse` | 도구 실행 후 | 도구 이름 | 로깅, 알림, 포맷팅 |
| `Stop` | 세션 종료 시 | (빈 문자열) | 정리, 워크플로우 트리거 |
| `SessionStart` | 세션 시작 시 | `startup`, `resume`, `clear` | 컨텍스트 로드, 환경 설정 |
| `UserPromptSubmit` | 사용자 입력 시 | (빈 문자열) | 입력 전처리 |
| `SubagentStart` | 서브에이전트 시작 | 에이전트 타입 | 서브에이전트 설정 |
| `SubagentStop` | 서브에이전트 종료 | 에이전트 타입 | 결과 수집 |

## 핸들러 타입

| 타입 | 설명 | 사용 시점 |
|------|------|----------|
| `command` | 셸 명령 실행, stdin으로 JSON 수신 | 스크립트 기반 검증 |
| `prompt` | Claude에게 단일 턴 프롬프트 전송 | 간단한 AI 기반 검증 |
| `agent` | 도구 사용 가능한 서브에이전트 생성 | 복잡한 다단계 검증 |
| `http` | URL로 POST 전송 | 웹훅 연동 |

## 스크립트 응답 형식

command 타입 스크립트는 stdout으로 JSON을 출력해야 합니다:

```json
{"decision": "approve"}
{"decision": "block", "reason": "차단 사유"}
{"decision": "approve", "warning": "경고 메시지"}
```

---

## 프리셋별 기본 설정

### 프리셋 1: 위험한 bash 명령 차단
- **이벤트**: `PreToolUse`
- **매처**: `Bash`
- **스크립트명**: `block-dangerous-commands.sh`
- **차단 패턴**: `rm -rf /`, `rm -rf ~`, `git push --force`, `git reset --hard`, `chmod 777`, `sudo rm`, `:(){ :|:& };:`
- 사용자에게 추가 패턴을 물어보세요

### 프리셋 2: 파일 쓰기 검증
- **이벤트**: `PreToolUse`
- **매처**: `Edit|Write`
- **스크립트명**: `validate-file-write.sh`
- **보호 경로**: 사용자에게 어떤 경로를 보호할지 질문 (예: `.env`, `credentials.*`, `*.key`)

### 프리셋 3: 세션 시작 컨텍스트 로드
- **이벤트**: `SessionStart`
- **매처**: `startup`
- **타입**: `command` 또는 `prompt`
- 사용자에게 무엇을 로드할지 질문 (프로젝트 상태, TODO, 최근 커밋 등)

### 프리셋 4: 세션 종료 워크플로우
- **이벤트**: `Stop`
- **매처**: `""` (빈 문자열)
- **타입**: `command`
- 사용자에게 어떤 워크플로우를 트리거할지 질문 (커밋, PR, 리포트 등)
