# 하이브리드 모델 전략 (OpusPlan)

> **출처**: [fcakyon/claude-codex-settings](https://github.com/fcakyon/claude-codex-settings)

## 개요

Opus(계획)와 Sonnet(실행)을 전략적으로 전환하여 비용을 최적화하는 패턴입니다.

## 핵심 아이디어

- **Opus (10-20%)**: 복잡한 추론, 아키텍처 설계, 전략적 결정
- **Sonnet (80-90%)**: 코드 생성, 구현, 반복 작업

## 사용 시점

| 단계 | 모델 | 이유 |
|------|------|------|
| 요구사항 분석 | Opus | 복잡한 이해 필요 |
| 아키텍처 설계 | Opus | 전략적 결정 |
| 코드 구현 | Sonnet | 빠른 생성 |
| 테스트 작성 | Sonnet | 패턴 기반 작업 |
| 코드 리뷰 | Opus | 깊은 분석 |
| 버그 수정 | Sonnet | 대부분 간단함 |

## 비용 절감 효과

고가의 Opus 모델을 필요한 곳에만 사용하여 전체 비용을 크게 절감할 수 있습니다.

## 참고 링크

- [원본 레포지토리](https://github.com/fcakyon/claude-codex-settings)
- [Claude Code 모델 설정 문서](https://code.claude.com/docs/en/model-config)
