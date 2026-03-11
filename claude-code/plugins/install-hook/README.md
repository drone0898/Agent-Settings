# install-hook

Claude Code hook을 인터랙티브하게 설치하는 플러그인입니다.

## Quickstart

```bash
# 1. 마켓플레이스 등록
/plugin marketplace add <owner>/Agent-Settings

# 2. 플러그인 설치
/plugin install install-hook@agent-settings

# 3. 사용
/install-hook:install-hook
```

## 기능

- 프리셋 hook 제공 (위험 명령 차단, 파일 쓰기 검증, 세션 hook 등)
- 커스텀 hook 생성 지원
- 설치 범위 선택: 전역 / 프로젝트 공유 / 로컬 전용
- 기존 settings 파일과 안전하게 머지
- 스크립트 자동 생성 (Bash/Python)

## 설치 범위

| 범위 | 파일 | 설명 |
|------|------|------|
| 전역 | `~/.claude/settings.json` | 모든 프로젝트에 적용 |
| 프로젝트 공유 | `.claude/settings.json` | 팀 공유 (커밋됨) |
| 로컬 전용 | `.claude/settings.local.json` | 개인용 (gitignore) |

## 지원 Hook 이벤트

| 이벤트 | 용도 |
|--------|------|
| `PreToolUse` | 도구 실행 전 검증/차단 |
| `PostToolUse` | 도구 실행 후 로깅/알림 |
| `Stop` | 세션 종료 시 워크플로우 트리거 |
| `SessionStart` | 세션 시작 시 컨텍스트 로드 |

## 로컬 테스트

```bash
claude --plugin-dir ./claude-code/plugins/install-hook
```
