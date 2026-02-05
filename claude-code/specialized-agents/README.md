# 전문 서브에이전트

재사용 가능한 전문 서브에이전트 모음입니다.

## 카테고리

| 카테고리 | 설명 |
|----------|------|
| [test-runners](./test-runners/) | 테스트 실행 에이전트 |
| [git-helpers](./git-helpers/) | Git 작업 도우미 |

## 서브에이전트 형식

```markdown
---
name: agent-name
description: 에이전트 설명
tools: Bash, Read, Write, ...
model: haiku | sonnet
---

# 에이전트 제목

(에이전트 지침)

## 실행 절차
1. ...
2. ...

## 반환 형식
...

## 규칙
- ...
```

## 모델 선택 가이드

| 모델 | 용도 | 예시 |
|------|------|------|
| haiku | 빠른 결정적 작업 | 테스트 실행, 파일 검색 |
| sonnet | 복잡한 추론 | 코드 분석, 버그 수정 |

## 사용법

`.claude/agents/` 디렉토리에 에이전트 파일을 배치하면 자동으로 등록됩니다.
