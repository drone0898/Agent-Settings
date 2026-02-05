# AGENTS.md / CLAUDE.md 패턴

프로젝트 루트에 배치하여 AI 에이전트에게 지침을 제공하는 마크다운 파일 패턴입니다.

## 디렉토리

| 패턴 | 설명 |
|------|------|
| [spec-driven/](./spec-driven/) | 스펙 중심 개발 - 구현 전 반드시 스펙 확인 |
| [session-history/](./session-history/) | 세션 간 컨텍스트 보존 |
| [templates/](./templates/) | 프로젝트 타입별 즉시 사용 가능한 템플릿 |

## AGENTS.md vs CLAUDE.md

두 파일 모두 동일한 목적으로 사용됩니다:
- `AGENTS.md`: 여러 AI 에이전트 도구에서 인식
- `CLAUDE.md`: Claude Code 전용

보통 둘 중 하나를 사용하거나, 심볼릭 링크로 연결합니다.

## 기본 구조

```markdown
<INSTRUCTIONS>
# 프로젝트 개요
- 프로젝트 설명
- 기술 스택

# 개발 규칙
- 코딩 컨벤션
- 필수 확인 사항

# 디렉토리 구조
- 주요 디렉토리 설명

# 작업 프로토콜
- 작업 시작 전 확인 사항
- 작업 완료 후 필수 행동
</INSTRUCTIONS>
```

## 사용법

1. 프로젝트에 맞는 패턴 선택
2. `AGENTS.md` 또는 `CLAUDE.md`로 프로젝트 루트에 복사
3. 프로젝트에 맞게 커스터마이징
