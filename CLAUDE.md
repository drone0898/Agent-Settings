<INSTRUCTIONS>
# Agent-Settings 레포지토리 규칙

## 디렉토리 구조 원칙

이 레포지토리는 **도구별로 분리**된 구조를 따른다:

| 디렉토리 | 대상 | 허용 파일 |
|----------|------|----------|
| `claude-code/` | Claude Code 전용 | `.claude/`, `CLAUDE.md`, settings.json |
| `agents-md/` | 범용 (모든 에이전트) | `AGENTS.md` 만 허용 |
| `cursor/` | Cursor 전용 | `.cursor/`, cursor 설정 |
| `references/` | 외부 참조 | 링크 필수 명시 |

## 핵심 규칙

### 1. agents-md/ 는 범용이다
- `CLAUDE.md` 파일 금지 (Claude Code 전용)
- `.claude/` 디렉토리 금지 (Claude Code 전용)
- `AGENTS.md` 또는 범용 마크다운만 허용
- 특정 도구 종속 설정 금지

### 2. claude-code/ 는 Claude Code 전용이다
- `.claude/` 디렉토리 사용
- `CLAUDE.md` 사용 가능
- `settings.local.json`, hooks, agents 등

### 3. references/ 는 출처 명시 필수
- 외부 레포지토리 참조 시 반드시 링크 포함
- `> **출처**: [repo-name](url)` 형식

## 파일 생성 전 체크리스트

새 파일/패턴 추가 시:
1. [ ] 대상 도구 확인 (범용 vs 특정 도구)
2. [ ] 올바른 디렉토리에 배치
3. [ ] 도구 종속 파일이 범용 디렉토리에 없는지 확인
4. [ ] 외부 참조 시 출처 링크 포함

## 위반 시 수정 방법

### agents-md/에 Claude Code 전용 파일이 있는 경우
1. 범용화 가능하면 → `AGENTS.md`로 변환
2. 범용화 불가능하면 → `claude-code/`로 이동

### 예시
```
# 잘못된 구조
agents-md/session-history/
├── CLAUDE.md           ❌ Claude Code 전용
└── .claude/agents/     ❌ Claude Code 전용

# 올바른 구조
agents-md/session-history/
├── AGENTS.md           ✅ 범용
└── agents/             ✅ 범용 (도구 중립적 이름)
    └── history-*.md
```

## 규칙 강제 수단

이 레포지토리는 다음 방법으로 규칙을 강제한다:

| 수단 | 위치 | 시점 |
|------|------|------|
| GitHub Actions | `.github/workflows/validate-structure.yml` | PR/Push 시 |
| Pre-commit Hook | `.githooks/pre-commit` | 커밋 시 |
| Hookify (Claude Code) | `.claude/hookify.validate-structure.local.md` | 파일 생성 시 |
| 검증 스크립트 | `scripts/validate-structure.sh` | 수동 실행 |

### Pre-commit Hook 활성화
```bash
git config core.hooksPath .githooks
```

### 수동 검증
```bash
./scripts/validate-structure.sh
```
</INSTRUCTIONS>
