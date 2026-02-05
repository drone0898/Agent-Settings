---
name: warn-debug-code
enabled: true
event: write
action: warn
conditions:
  - field: content
    operator: regex_match
    pattern: "(console\\.log|debugger|print\\()"
---

**경고: 디버그 코드가 감지되었습니다**

파일에 디버그 코드가 포함되어 있습니다:
- `console.log`
- `debugger`
- `print()`

커밋 전에 제거하는 것을 잊지 마세요!
