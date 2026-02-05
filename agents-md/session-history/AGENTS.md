# 프로젝트 AI 가이드

## 세션 히스토리 관리

### 세션 시작 시
`history-load` 에이전트를 호출하여 현재 프로젝트 상태를 파악합니다.

### 세션 종료 시
의미있는 작업을 수행했다면 `history-save` 에이전트를 호출하여 기록합니다.

### 기록 대상
- 기능 구현
- 아키텍처 결정
- 버그 수정
- 블로커 해결

### 기록하지 않는 것
- Q&A만 한 세션
- 탐색/리서치만 한 세션
- 사소한 수정

## 프로젝트 구조

```
/
├── agent/
│   └── history/
│       ├── current_state.md    # 현재 상태 (항상 최신)
│       ├── sessions/           # 세션 로그
│       ├── decisions/          # ADR
│       └── archive/            # 아카이브
└── (프로젝트 파일들)
```

## 주요 문서
- `agent/history/current_state.md` - 프로젝트 현재 상태
- `agent/history/README.md` - 히스토리 시스템 문서
