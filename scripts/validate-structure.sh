#!/bin/bash
# 레포지토리 구조 검증 스크립트
# 사용: ./scripts/validate-structure.sh

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "=== Agent-Settings 구조 검증 ==="
echo ""

ERRORS=0

# 1. agents-md/에 CLAUDE.md가 있으면 안됨
echo "1. agents-md/ Claude 전용 파일 검사..."
if find agents-md -name "CLAUDE.md" 2>/dev/null | grep -q .; then
    echo -e "${RED}❌ agents-md/에 CLAUDE.md 발견${NC}"
    find agents-md -name "CLAUDE.md"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}✅ CLAUDE.md 없음${NC}"
fi

# 2. agents-md/에 .claude/ 디렉토리가 있으면 안됨
echo ""
echo "2. agents-md/ .claude 디렉토리 검사..."
if find agents-md -type d -name ".claude" 2>/dev/null | grep -q .; then
    echo -e "${RED}❌ agents-md/에 .claude/ 디렉토리 발견${NC}"
    find agents-md -type d -name ".claude"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}✅ .claude 디렉토리 없음${NC}"
fi

# 3. references/에 출처 링크 확인
echo ""
echo "3. references/ 출처 링크 검사..."
for file in references/*.md; do
    if [ -f "$file" ] && [ "$(basename $file)" != "README.md" ]; then
        if ! grep -q "출처.*\[.*\](http" "$file" && ! grep -q "Source.*\[.*\](http" "$file"; then
            echo -e "${RED}❌ $file - 출처 링크 없음${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    fi
done
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ 모든 참조 문서에 출처 있음${NC}"
fi

# 4. JSON 파일 유효성
echo ""
echo "4. JSON 파일 유효성 검사..."
while IFS= read -r -d '' file; do
    if ! python3 -c "import json; json.load(open('$file'))" 2>/dev/null; then
        echo -e "${RED}❌ $file - 유효하지 않은 JSON${NC}"
        ERRORS=$((ERRORS + 1))
    fi
done < <(find . -name "*.json" -not -path "./.git/*" -print0)
echo -e "${GREEN}✅ JSON 파일 검증 완료${NC}"

# 결과
echo ""
echo "=== 검증 결과 ==="
if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}❌ $ERRORS개 오류 발견${NC}"
    exit 1
else
    echo -e "${GREEN}✅ 모든 검증 통과${NC}"
    exit 0
fi
