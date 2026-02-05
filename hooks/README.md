# 훅 예제

Claude Code 훅 예제 모음입니다.

## 훅 타입

| 이벤트 | 발생 시점 | 용도 |
|--------|----------|------|
| `PreToolUse` | 도구 실행 전 | 검증, 위험 명령 차단 |
| `PostToolUse` | 도구 실행 후 | 로깅, 알림 |
| `Stop` | 세션 종료 시 | 정리, 워크플로우 트리거 |
| `SessionStart` | 세션 시작 시 | 설정, 알림 |

## 디렉토리

| 디렉토리 | 설명 |
|----------|------|
| [bash-validators](./bash-validators/) | Bash 명령 검증기 |
| [session-hooks](./session-hooks/) | 세션 라이프사이클 훅 |

## hooks.json 형식

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "python3 validate.py"
          }
        ]
      }
    ]
  }
}
```

## hookify vs hooks.json

| 특성 | hookify | hooks.json |
|------|---------|------------|
| 작성 방식 | 마크다운 | JSON |
| 난이도 | 쉬움 | 중간 |
| 유연성 | 제한적 | 높음 |
| 추천 용도 | 간단한 훅 | 복잡한 검증 |
