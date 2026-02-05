# 권한 프로필

다양한 사용 시나리오에 맞는 권한 설정 프리셋입니다.

## 프로필 목록

| 프로필 | 설명 | 사용 시나리오 |
|--------|------|-------------|
| [minimal](./minimal/) | 최소 권한 | 민감한 환경, 처음 사용 |
| [development](./development/) | 개발 환경 권한 | 일반 개발 작업 |
| [sandbox](./sandbox/) | 샌드박스 환경 | 격리된 실험 환경 |

## 사용법

1. 원하는 프로필의 `settings.local.json` 복사
2. 프로젝트의 `.claude/` 디렉토리에 배치
3. 필요에 따라 권한 추가/제거

## 권한 구조

```json
{
  "permissions": {
    "allow": [
      "Bash(npm:*)",
      "Bash(git:*)"
    ],
    "deny": [
      "Bash(rm -rf:*)"
    ]
  }
}
```

## 주의사항

- `settings.local.json`은 `.gitignore`에 추가 권장
- 민감한 명령어는 명시적으로 차단
- 프로덕션 환경에서는 minimal 프로필 권장
