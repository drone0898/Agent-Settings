# 추천 플러그인 가이드

Claude Code에서 사용할 수 있는 추천 플러그인들의 사용 가이드입니다.

## 플러그인 설치

```bash
/plugin install <plugin-name>
```

## 추천 플러그인

| 플러그인 | 용도 | 설치 명령어 |
|---------|------|-----------|
| [code-review](./code-review/) | 자동 코드 리뷰 | `/plugin install code-review` |
| [ralph-loop](./ralph-loop/) | 반복 수정 루프 | `/plugin install ralph-loop` |
| [hookify](./hookify/) | 커스텀 훅 생성 | `/plugin install hookify` |
| [feature-dev](./feature-dev/) | 7단계 기능 개발 | `/plugin install feature-dev` |

## 플러그인 활성화

`settings.local.json`에서 플러그인 활성화:

```json
{
  "enabledPlugins": {
    "code-review@claude-plugins-official": true,
    "ralph-loop@claude-plugins-official": true
  }
}
```

## 공식 플러그인 마켓플레이스

- [anthropic/claude-code/plugins](https://github.com/anthropics/claude-code/tree/main/plugins)
