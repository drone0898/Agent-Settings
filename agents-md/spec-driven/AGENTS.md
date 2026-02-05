<INSTRUCTIONS>
## Spec-Driven Development (필수)
- 이 레포는 **spec-driven**으로 개발한다. 구현/리팩터링/버그수정 전 반드시 관련 스펙을 확인한다.
- 단일 진실(Source of Truth): `spec/`
- 스펙이 없으면: 코드를 먼저 쓰지 말고, 최소 스펙(목표/비목표/수용기준)을 `spec/`에 먼저 만든다.

## 스펙 로딩 프로토콜 (컨텍스트 절약형)

### 작업 시작 시
1. **반드시** `spec/README.md`를 먼저 읽는다
2. 어떤 스펙이 해당되는지 결정한다
3. **필요한 문서만** 읽는다 (전체 로드 금지)

### 스펙 로딩 우선순위
1. TL;DR / Status
2. Interfaces / Data Contracts
3. Acceptance Criteria

### 디렉토리별 역할
| 디렉토리 | 내용 |
|----------|------|
| `spec/overview/` | 아키텍처, 개념, 기술스택 |
| `spec/contracts/` | 데이터 계약, 인터페이스, 스키마 |
| `spec/operations/` | 설정, 관측성, 마일스톤 |
| `spec/tasks/` | 작업 단위 스펙 |
| `spec/decisions/` | ADR (Architecture Decision Records) |

### 관련 스펙을 못 찾겠으면
1. `spec/README.md`에 "스펙 누락"으로 기록
2. 사용자에게 1~3개의 짧은 확인 질문
3. `spec/tasks/`에 작업 스펙을 생성

## 구현 순서 (항상)
1. 스펙 업데이트/신규 작성
2. 구현
3. 최소 검증 (테스트/fixture/trace 중 가능한 것)

변경이 스펙과 충돌하면: "코드를 스펙에 맞춘다" 또는 "스펙을 변경한다" 중 하나를 **명시적으로 선택**하고 스펙에 근거를 남긴다.

## 결과물 기록 규칙
코드 변경이 발생한 작업은 답변에 다음을 항상 포함한다:
- 참고/수정한 스펙 경로
- 변경한 파일 경로
- 실행한 검증 커맨드 (있으면)
</INSTRUCTIONS>
