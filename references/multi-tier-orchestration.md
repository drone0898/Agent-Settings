# Sonnet + Haiku 3티어 오케스트레이션

> **출처**: [wshobson/commands](https://github.com/wshobson/commands)

## 개요

Haiku(빠른 결정적 작업)와 Sonnet(복잡한 추론)을 멀티에이전트로 조율하는 패턴입니다.

## 티어 구성

| 티어 | 모델 | 용도 | 예시 |
|------|------|------|------|
| 1 | Haiku | 빠른 결정적 작업 | 파일 검색, 간단한 변환 |
| 2 | Sonnet | 복잡한 추론 | 코드 분석, 버그 수정 |
| 3 | Opus | 전략적 결정 | 아키텍처 설계 |

## 워크플로우 패턴

```
Planning (Sonnet)
    │
    ▼
Execution (Haiku) ×N
    │
    ▼
Review (Sonnet)
```

## 장점

- 각 모델의 강점을 최대 활용
- 비용 효율적인 리소스 배분
- 병렬 처리로 속도 향상

## 참고 링크

- [원본 레포지토리](https://github.com/wshobson/commands)
