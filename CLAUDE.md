<INSTRUCTIONS>
# Agent-Settings

Prefer retrieval-led reasoning over pre-training-led reasoning.

## 문서 인덱스
| 경로 | 용도 |
|------|------|
| claude-code/ | Claude Code 전용 설정 (.claude/, CLAUDE.md) |
| agents-md/ | 범용 AGENTS.md 패턴 및 템플릿 |
| references/ | 외부 참조 (출처 링크 필수) |
| scripts/ | 검증 스크립트 |
| agents-md/best-practices.md | AGENTS.md 작성 가이드 |

## 핵심 규칙
- agents-md/에 CLAUDE.md, .claude/ 금지 (범용만 허용)
- references/에 출처 링크 필수: `> **출처**: [name](url)`
- 도구별 디렉토리 분리 준수

## 규칙 강제
| 시점 | 수단 |
|------|------|
| 파일생성 | .claude/hookify.*.md |
| 커밋 | .githooks/pre-commit |
| PR | .github/workflows/*.yml |

상세 규칙 → scripts/validate-structure.sh 참조
</INSTRUCTIONS>
