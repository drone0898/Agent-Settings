# Claude Code 설정

Claude Code CLI 도구를 위한 설정, 훅, 서브에이전트 모음입니다.

## 디렉토리

| 패턴 | 설명 |
|------|------|
| [pr-review-workflow/](./pr-review-workflow/) | 자동화된 PR 리뷰 및 수정 워크플로우 |
| [permission-profiles/](./permission-profiles/) | 권한 프리셋 (minimal, development, sandbox) |
| [safety-hooks/](./safety-hooks/) | 안전 훅 예제 (hookify) |
| [specialized-agents/](./specialized-agents/) | 재사용 가능한 서브에이전트 |

## 설정 파일 위치

```
your-project/
└── .claude/
    ├── settings.local.json    # 로컬 설정 (gitignore 권장)
    ├── settings.json          # 공유 설정
    ├── commands/              # 커스텀 커맨드
    ├── agents/                # 서브에이전트
    └── hooks/                 # 훅 스크립트
```

## 사용법

1. 원하는 패턴의 `.claude/` 디렉토리를 프로젝트 루트에 복사
2. `settings.local.json`에서 권한 및 경로 수정
3. 필요한 플러그인 설치: `/plugin install <plugin-name>`
