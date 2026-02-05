---
name: require-tests
enabled: true
event: bash
action: warn
conditions:
  - field: command
    operator: regex_match
    pattern: "git\\s+commit"
---

**테스트 확인 알림**

커밋하기 전에 테스트를 실행했는지 확인하세요:

```bash
npm run test
# 또는
npm run test:run
```

테스트 없이 커밋하면 CI에서 실패할 수 있습니다.
