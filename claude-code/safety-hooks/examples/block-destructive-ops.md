---
name: block-destructive-ops
enabled: true
event: bash
action: block
conditions:
  - field: command
    operator: regex_match
    pattern: "rm\\s+-rf\\s+(/|~|\\$HOME)"
---

**위험: 파괴적인 명령이 감지되었습니다!**

루트 디렉토리 또는 홈 디렉토리 삭제 명령은 허용되지 않습니다.

이 작업을 정말 수행해야 한다면:
1. 이 훅을 일시적으로 비활성화하거나
2. 수동으로 터미널에서 실행하세요
