# Bash 검증기

Bash 명령 실행 전 검증하는 훅 예제입니다.

## 사용법

1. 검증 스크립트를 `.claude/hooks/` 에 배치
2. `hooks.json` 에서 검증기 등록

## hooks.json 예시

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "python3 .claude/hooks/validate_bash.py"
          }
        ]
      }
    ]
  }
}
```

## 검증기 응답 형식

```json
// 허용
{"decision": "approve"}

// 차단
{"decision": "block", "reason": "위험한 명령입니다"}

// 경고 후 허용
{"decision": "approve", "warning": "주의하세요"}
```

## 공식 예제

- [anthropic/claude-code/examples/hooks](https://github.com/anthropics/claude-code/tree/main/examples/hooks)
