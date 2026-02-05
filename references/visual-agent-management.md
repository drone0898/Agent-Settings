# Tide Commander - 비주얼 에이전트 관리

> **출처**: [deivid11/tide-commander](https://github.com/deivid11/tide-commander)

## 개요

RTS 게임 스타일의 3D 인터페이스로 다중 Claude Code 인스턴스를 관리하는 도구입니다.

## 주요 기능

### 실시간 모니터링
- WebSocket 기반 실시간 활동 피드
- 세션 지속성
- 파일 변경 추적

### 권한 관리
- **자율 모드**: 안전한 도구 자동 승인
- **대화형 모드**: 위험한 작업 승인 요청
- 패턴 기반 권한 기억

### 비주얼 인터페이스
- 에이전트 위치 시각화
- 진행 상황 실시간 표시
- 게임 스타일 컨트롤

## 3레이어 구조

1. **Command Layer**: 에이전트 관리 및 명령
2. **Execution Layer**: 작업 실행 및 모니터링
3. **Permission Layer**: 권한 제어 및 승인

## 활용 시나리오

- 여러 프로젝트 동시 작업
- 복잡한 멀티에이전트 워크플로우 시각화
- 팀 협업 시 작업 상태 공유

## 참고 링크

- [원본 레포지토리](https://github.com/deivid11/tide-commander)
