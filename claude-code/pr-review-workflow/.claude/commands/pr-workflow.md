# PR 워크플로우 자동화

작업 종료 시 자동 실행되는 PR 워크플로우입니다.

## 브랜치 전략
- `main`: 운영 브랜치 (보호됨)
- `dev`: 개발 브랜치 (보호됨)
- `feat`: 피쳐 브랜치 (보호됨, 개발 작업의 첫 번째 merge 대상)
- 작업 브랜치: `feat/*`, `fix/*`, `chore/*` 등

## 0단계: 변경사항 확인 (필수)
```bash
git status --porcelain
```

**변경사항이 없으면 (출력이 비어있으면):**
- "변경사항 없음. 워크플로우 종료." 출력 후 즉시 종료

**변경사항이 있으면:** 0.5단계로 진행

## 0.5단계: 브랜치 보호 확인 (커밋 전 필수)
```bash
git branch --show-current
```

**보호된 브랜치(main, dev, feat)에 있는 경우:**
1. 변경 내용을 분석하여 적절한 브랜치명 생성:
   - 기능 추가: `feat/{기능명}` (예: `feat/add-banner`)
   - 버그 수정: `fix/{버그명}` (예: `fix/login-error`)
   - 설정/기타: `chore/{작업명}` (예: `chore/update-hooks`)
2. 새 브랜치 생성 및 이동:
   ```bash
   git checkout -b {새브랜치명}
   ```
3. 1단계로 진행 (새 브랜치에서 커밋 및 PR 생성)

**작업 브랜치에 있는 경우:** 1단계로 바로 진행

## 1단계: 커밋 및 푸시
1. 변경사항 스테이징 및 커밋
2. 원격 브랜치로 푸시

## 2단계: PR 상태 확인 및 생성
```bash
gh pr view --json number,title,state 2>/dev/null || echo "NO_PR"
```

- PR이 없으면:
  - 현재 브랜치가 `feat/*`, `fix/*`, `chore/*` 등인 경우 → `--base feat`으로 PR 생성
  - `gh pr create --base feat`
- PR이 있으면 3단계로 진행

## 3단계: Code Review 실행
`/code-review` 스킬을 실행하여 PR 리뷰

## 4단계: 리뷰 결과 처리
- **지적사항 없음**: "PR 워크플로우 완료!" 출력 후 종료
- **지적사항 있음**: 5단계로 진행

## 5단계: Ralph-loop로 수정
```
/ralph-loop "code-review 지적사항을 모두 수정하세요. 완료 후 <promise>FIXED</promise> 출력" --max-iterations 10 --completion-promise FIXED
```

## 6단계: 재검토
`/code-review` 재실행. 지적사항 없을 때까지 반복 (최대 3회)
