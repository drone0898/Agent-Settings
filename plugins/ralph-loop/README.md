# ralph-loop 플러그인

지정된 목표를 달성할 때까지 반복 수정을 수행하는 플러그인입니다.

## 설치

```bash
/plugin install ralph-loop
```

## 사용법

```bash
/ralph-loop "목표 설명" --max-iterations 10 --completion-promise DONE
```

## 파라미터

| 파라미터 | 설명 | 기본값 |
|---------|------|-------|
| `--max-iterations` | 최대 반복 횟수 | 10 |
| `--completion-promise` | 완료 시 출력할 문자열 | - |

## 활용 예시

### 코드 리뷰 지적사항 수정
```bash
/ralph-loop "code-review 지적사항을 모두 수정하세요. 완료 후 <promise>FIXED</promise> 출력" --max-iterations 10 --completion-promise FIXED
```

### 테스트 통과까지 수정
```bash
/ralph-loop "모든 테스트가 통과할 때까지 코드를 수정하세요" --max-iterations 5
```

## 설정

`settings.local.json`:
```json
{
  "enabledPlugins": {
    "ralph-loop@claude-plugins-official": true
  }
}
```

## 참고

- [공식 문서](https://github.com/anthropics/claude-code/tree/main/plugins/ralph-wiggum)
