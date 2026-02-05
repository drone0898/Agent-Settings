# feature-dev 플러그인

7단계 기능 개발 워크플로우를 자동화하는 플러그인입니다.

## 설치

```bash
/plugin install feature-dev
```

## 사용법

```bash
/feature-dev "기능 설명"
```

## 7단계 워크플로우

| 단계 | 에이전트 | 역할 |
|------|---------|------|
| 1 | Explorer | 코드베이스 탐색 |
| 2 | Architect | 설계 및 계획 |
| 3 | Implementer | 코드 구현 |
| 4 | Tester | 테스트 작성 |
| 5 | Reviewer | 코드 리뷰 |
| 6 | Documenter | 문서화 |
| 7 | Deployer | 배포 준비 |

## 특징

- 각 단계별 전문 에이전트 사용
- 단계 간 컨텍스트 자동 전달
- 실패 시 해당 단계부터 재시작 가능

## 설정

`settings.local.json`:
```json
{
  "enabledPlugins": {
    "feature-dev@claude-plugins-official": true
  }
}
```

## 참고

- [공식 문서](https://github.com/anthropics/claude-code/tree/main/plugins/feature-dev)
