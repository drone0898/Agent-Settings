# hookify 플러그인

마크다운으로 커스텀 훅을 쉽게 생성하는 플러그인입니다.

## 설치

```bash
/plugin install hookify
```

## 사용법

`.claude/hookify.*.local.md` 파일을 생성하여 훅을 정의합니다.

## 훅 파일 형식

```markdown
---
name: hook-name
enabled: true
event: bash
action: warn | block
conditions:
  - field: command
    operator: regex_match
    pattern: "위험한 패턴"
---

경고 또는 차단 메시지
```

## 지원 이벤트

| 이벤트 | 설명 |
|--------|------|
| `bash` | Bash 명령 실행 전 |
| `write` | 파일 쓰기 전 |
| `edit` | 파일 편집 전 |

## 액션 타입

| 액션 | 설명 |
|------|------|
| `warn` | 경고 메시지 표시 후 계속 |
| `block` | 작업 차단 |

## 예시

### 위험한 명령 차단
```markdown
---
name: block-rm-rf
enabled: true
event: bash
action: block
conditions:
  - field: command
    operator: regex_match
    pattern: "rm\\s+-rf\\s+/"
---

위험: 루트 디렉토리 삭제 명령이 감지되었습니다!
```

### Git 작업 경고
```markdown
---
name: warn-force-push
enabled: true
event: bash
action: warn
conditions:
  - field: command
    operator: regex_match
    pattern: "git push.*--force"
---

경고: force push가 감지되었습니다. 정말 진행하시겠습니까?
```

## 참고

- [공식 문서](https://github.com/anthropics/claude-code/tree/main/plugins/hookify)
