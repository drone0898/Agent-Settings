# 세션 훅

세션 시작/종료 시 실행되는 훅 예제입니다.

## Stop 훅

세션 종료 시 실행됩니다.

### 예시: PR 워크플로우 트리거

```bash
#!/bin/bash
# .claude/hooks/stop.sh

if [ -n "$(git status --porcelain)" ]; then
  echo '{"decision": "block", "reason": "/pr-workflow"}'
else
  echo '{"decision": "approve"}'
fi
```

### hooks.json

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/stop.sh"
          }
        ]
      }
    ]
  }
}
```

## SessionStart 훅

세션 시작 시 실행됩니다. (히스토리 로드 등에 활용)

## 응답 형식

```json
// 세션 계속
{"decision": "approve"}

// 세션 종료 차단 + 명령 실행
{"decision": "block", "reason": "/command-to-run"}
```
