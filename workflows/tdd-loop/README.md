# TDD 루프 워크플로우

테스트 주도 개발(Test-Driven Development) 사이클을 자동화하는 워크플로우입니다.

## TDD 사이클

```
1. Red: 실패하는 테스트 작성
       │
       ▼
2. Green: 테스트 통과하는 최소 코드 작성
       │
       ▼
3. Refactor: 코드 정리
       │
       ▼
   (반복)
```

## 워크플로우

```
요구사항 분석
    │
    ▼
테스트 케이스 작성 (실패 예상)
    │
    ▼
테스트 실행 → 실패 확인
    │
    ▼
최소 구현 작성
    │
    ▼
테스트 실행 → 통과 확인
    │
    ▼
리팩토링
    │
    ▼
테스트 실행 → 통과 확인
    │
    ▼
다음 테스트 케이스로 반복
```

## 관련 에이전트

- `test-runner`: 테스트 실행 및 결과 요약
- `e2e-test-runner`: E2E 테스트 실행

## 명령어 예시

```bash
# 테스트 실행
npm run test:run

# 테스트 와치 모드
npm run test:watch

# E2E 테스트
npm run test:e2e
```
