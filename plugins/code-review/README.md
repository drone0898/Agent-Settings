# code-review 플러그인

PR 코드를 자동으로 리뷰하는 플러그인입니다.

## 설치

```bash
/plugin install code-review
```

## 사용법

```bash
/code-review
```

## 기능

- 5개의 병렬 Sonnet 에이전트로 코드 리뷰
- 스타일, 버그, 보안, 성능, 가독성 검사
- 개선 제안 및 수정 방법 제시

## 설정

`settings.local.json`:
```json
{
  "permissions": {
    "allow": [
      "Skill(code-review:code-review)"
    ]
  },
  "enabledPlugins": {
    "code-review@claude-plugins-official": true
  }
}
```

## 함께 사용하면 좋은 플러그인

- `ralph-loop`: 리뷰 지적사항 자동 수정
- `hookify`: 커밋 전 자동 리뷰 트리거

## 참고

- [공식 문서](https://github.com/anthropics/claude-code/tree/main/plugins/code-review)
