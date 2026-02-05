# Agent Settings

코딩 에이전트 설정들을 도구 타입과 사용 패턴별로 정리한 컬렉션입니다.

## 구조

| 카테고리 | 설명 |
|----------|------|
| [claude-code/](./claude-code/) | Claude Code 설정, 훅, 에이전트, 권한 프로필 |
| [agents-md/](./agents-md/) | AGENTS.md 템플릿과 패턴 |
| [plugins/](./plugins/) | 추천 플러그인 사용 가이드 |
| [workflows/](./workflows/) | 완성형 워크플로우 패턴 |
| [hooks/](./hooks/) | 훅 예제 및 검증기 |
| [references/](./references/) | 외부 레포지토리 참조 (링크 포함) |

## 주요 패턴

### 1. PR 리뷰 워크플로우
자동으로 코드 리뷰를 실행하고, 이슈를 수정하고, PR을 생성합니다.
- [claude-code/pr-review-workflow/](./claude-code/pr-review-workflow/)

### 2. 스펙 중심 개발
모든 구현 전에 스펙 문서를 먼저 확인하도록 강제합니다.
- [agents-md/spec-driven/](./agents-md/spec-driven/)

### 3. 세션 히스토리
세션 간 컨텍스트를 보존하여 연속 작업을 지원합니다.
- [agents-md/session-history/](./agents-md/session-history/)

## 빠른 시작

1. 원하는 패턴 디렉토리로 이동
2. `.claude/` 또는 설정 파일을 프로젝트 루트에 복사
3. 프로젝트에 맞게 커스터마이징

## 외부 참조

다음 레포지토리들에서 유용한 패턴들을 참조했습니다:
- [fcakyon/claude-codex-settings](https://github.com/fcakyon/claude-codex-settings) - 하이브리드 모델 전략, MCP 플러그인
- [wshobson/commands](https://github.com/wshobson/commands) - 멀티에이전트 워크플로우
- [deivid11/tide-commander](https://github.com/deivid11/tide-commander) - 비주얼 에이전트 관리

자세한 내용은 [references/](./references/)를 참고하세요.

## 기여하기

1. Fork
2. 브랜치 생성 (`git checkout -b feature/amazing-pattern`)
3. 커밋 (`git commit -m 'Add amazing pattern'`)
4. Push (`git push origin feature/amazing-pattern`)
5. Pull Request

## 라이선스

MIT License - [LICENSE](./LICENSE) 참고
