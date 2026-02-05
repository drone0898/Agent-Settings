# 안전 훅 (Safety Hooks)

hookify 플러그인을 사용한 안전 훅 예제 모음입니다.

## 설치

1. hookify 플러그인 설치: `/plugin install hookify`
2. 원하는 훅 파일을 `.claude/` 디렉토리에 복사
3. 파일명을 `hookify.*.local.md` 형식으로 유지

## 예제 목록

| 파일 | 설명 |
|------|------|
| [block-destructive-ops.md](./examples/block-destructive-ops.md) | 위험한 명령 차단 |
| [warn-debug-code.md](./examples/warn-debug-code.md) | 디버그 코드 경고 |
| [require-tests.md](./examples/require-tests.md) | 테스트 필수 요구 |

## 훅 작성 가이드

```markdown
---
name: hook-name
enabled: true
event: bash | write | edit
action: warn | block
conditions:
  - field: command | file_path | content
    operator: regex_match | contains | equals
    pattern: "패턴"
---

사용자에게 표시할 메시지
```

## 조건 연산자

| 연산자 | 설명 |
|--------|------|
| `regex_match` | 정규식 매칭 |
| `contains` | 문자열 포함 |
| `equals` | 정확히 일치 |
