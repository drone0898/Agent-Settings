---
name: validate-structure
enabled: true
event: write
action: warn
conditions:
  - field: file_path
    operator: regex_match
    pattern: "agents-md/.*(CLAUDE\\.md|\\.claude/)"
---

**구조 규칙 위반 경고**

`agents-md/` 디렉토리에 Claude Code 전용 파일을 생성하려고 합니다.

**규칙:**
- `agents-md/` = 범용 패턴 (모든 AI 에이전트용)
- `CLAUDE.md`, `.claude/` 는 `claude-code/` 디렉토리에만 허용

**수정 방법:**
1. 범용 패턴이면 → `AGENTS.md` 또는 `agents/` 사용
2. Claude Code 전용이면 → `claude-code/` 디렉토리로 이동
