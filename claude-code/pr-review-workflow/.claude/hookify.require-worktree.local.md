---
name: require-worktree
enabled: true
event: bash
action: warn
conditions:
  - field: command
    operator: regex_match
    pattern: "git (add|commit|push)"
---

**Git Worktree 확인**

현재 메인 워크트리에서 작업 중입니다.
병렬 작업이 필요하면 git worktree를 사용하세요:

```bash
git worktree add ../<project-name>-{branch} -b {branch}
```
