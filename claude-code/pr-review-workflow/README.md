# PR 리뷰 워크플로우

자동으로 코드 리뷰를 실행하고, 이슈를 수정하고, PR을 생성하는 완전 자동화 워크플로우입니다.

## 기능

- 보호된 브랜치 감지 및 자동 피처 브랜치 생성
- `/code-review` 플러그인을 통한 자동 코드 리뷰
- `/ralph-loop` 플러그인을 통한 반복 수정
- 세션 종료 시 자동 PR 워크플로우 트리거

## 필요 플러그인

```bash
/plugin install code-review
/plugin install ralph-loop
/plugin install hookify
```

## 파일 구조

```
.claude/
├── settings.local.json              # 권한 및 플러그인 설정
├── commands/
│   └── pr-workflow.md               # 7단계 PR 워크플로우
├── agents/
│   ├── test-runner.md               # 유닛 테스트 실행기
│   ├── e2e-test-runner.md           # E2E 테스트 실행기
│   └── worktree-manager.md          # Git worktree 관리
├── hooks/
│   ├── hooks.json                   # 훅 설정
│   └── stop.sh                      # 세션 종료 훅
└── hookify.require-worktree.local.md  # 메인 브랜치 보호 경고
```

## 워크플로우 단계

| 단계 | 설명 |
|------|------|
| 0 | 변경사항 확인 (`git status --porcelain`) |
| 0.5 | 브랜치 보호 확인 → 필요시 피처 브랜치 생성 |
| 1 | 커밋 및 푸시 |
| 2 | PR 상태 확인 및 생성 |
| 3 | `/code-review` 실행 |
| 4 | 리뷰 결과 처리 |
| 5 | `/ralph-loop`로 자동 수정 (최대 10회) |
| 6 | 재검토 (최대 3회 반복) |

## 브랜치 전략

```
main (보호됨)
  └── dev (보호됨)
        └── feat (보호됨, 첫 번째 merge 대상)
              └── feat/* | fix/* | chore/* (작업 브랜치)
```

## 설정

### settings.local.json

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run test:*)",
      "Bash(npm run build:*)",
      "Bash(git:*)",
      "Bash(gh:*)",
      "Skill(code-review:code-review)"
    ]
  },
  "enabledPlugins": {
    "code-review@claude-plugins-official": true,
    "ralph-loop@claude-plugins-official": true,
    "hookify@claude-plugins-official": true
  }
}
```

## 사용법

1. `.claude/` 디렉토리를 프로젝트에 복사
2. 플러그인 설치
3. 테스트 커맨드를 프로젝트에 맞게 수정
4. 작업 완료 후 `/pr-workflow` 실행 또는 세션 종료 시 자동 실행
