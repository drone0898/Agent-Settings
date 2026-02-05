# 스크립트

레포지토리 관리를 위한 스크립트 모음입니다.

## validate-structure.sh

레포지토리 구조 규칙 검증 스크립트입니다.

### 사용법

```bash
./scripts/validate-structure.sh
```

### 검증 항목

1. `agents-md/`에 `CLAUDE.md` 없음
2. `agents-md/`에 `.claude/` 디렉토리 없음
3. `references/`의 모든 문서에 출처 링크 있음
4. 모든 JSON 파일이 유효함

### CI에서 사용

GitHub Actions에서 자동으로 실행됩니다.
`.github/workflows/validate-structure.yml` 참고.
