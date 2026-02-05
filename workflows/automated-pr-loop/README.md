# 자동화된 PR 루프 워크플로우

코드 리뷰부터 수정까지 자동으로 반복하는 워크플로우입니다.

## 필요 플러그인

```bash
/plugin install code-review
/plugin install ralph-loop
```

## 워크플로우 흐름

```
변경사항 확인
    │
    ▼
브랜치 체크 (보호된 브랜치면 새 브랜치 생성)
    │
    ▼
커밋 & 푸시
    │
    ▼
PR 생성/확인
    │
    ▼
/code-review 실행
    │
    ├── 지적사항 없음 → 완료
    │
    └── 지적사항 있음
            │
            ▼
        /ralph-loop로 수정
            │
            ▼
        재리뷰 (최대 3회 반복)
```

## 설정

자세한 설정은 [claude-code/pr-review-workflow](../../claude-code/pr-review-workflow/)를 참고하세요.

## 트리거 방법

1. **수동**: `/pr-workflow` 커맨드 실행
2. **자동**: Stop 훅을 통해 세션 종료 시 자동 실행
