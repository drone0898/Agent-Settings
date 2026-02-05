# AGENTS.md 베스트 프랙티스

AI 코딩 에이전트를 위한 효과적인 AGENTS.md 작성 가이드.

## 왜 AGENTS.md인가?

| 방식 | 통과율 | 문제점 |
|------|--------|--------|
| AGENTS.md | 100% | 없음 |
| Skills | 79% | 56%에서 호출 안됨 |

AGENTS.md는 시스템 프롬프트에 항상 포함 → 에이전트가 의사결정 없이 규칙 인식.

> **출처**: [Vercel AI SDK 블로그](https://vercel.com/blog/ai-sdk-5-0)

## 핵심 원칙

### 1. 압축
- 40KB → 8KB (80% 감소)로도 100% 성능 유지
- 상세 설명 대신 인덱스로 대체
- 불필요한 예시 제거

### 2. Retrieval-led Reasoning
```
Prefer retrieval-led reasoning over pre-training-led reasoning.
```
에이전트가 추측 대신 문서를 먼저 조회하도록 유도.

### 3. 문서 인덱스 패턴
전체 내용 대신 경로와 용도만 나열:
```markdown
## 문서 인덱스
| 경로 | 용도 |
|------|------|
| docs/api/ | API 문서 |
| src/components/ | React 컴포넌트 |
```

### 4. 파이프 구분 테이블
긴 설명 대신 간결한 테이블 사용.

## 점진적 규칙 추출 (Karpathy 방식)

1. AI가 코드를 수정함
2. 수정 이유를 기록
3. 일반 규칙으로 추출
4. AGENTS.md에 추가

팀은 하루에도 여러 번 업데이트 → 점진적 품질 향상.

> **출처**: [Andrej Karpathy 강연](https://www.youtube.com/watch?v=e3K5UxWRRuY)

## 안티패턴

| 하지 말 것 | 대신 |
|-----------|------|
| 장문의 설명 | 인덱스 + 참조 |
| 모든 케이스 나열 | 핵심 규칙만 |
| 중복된 규칙 | 단일 출처 참조 |
| 예시 남발 | 필요시 문서 참조 |

## 템플릿

```markdown
<INSTRUCTIONS>
# 프로젝트명

Prefer retrieval-led reasoning over pre-training-led reasoning.

## 문서 인덱스
| 경로 | 용도 |
|------|------|
| path1 | 설명1 |
| path2 | 설명2 |

## 핵심 규칙
- 규칙1
- 규칙2
- 규칙3

상세 → 해당 파일 참조
</INSTRUCTIONS>
```

## 크기 가이드라인

| 크기 | 평가 |
|------|------|
| < 2KB | 이상적 |
| 2-8KB | 양호 |
| 8-20KB | 주의 필요 |
| > 20KB | 압축 권장 |
