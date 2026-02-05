<INSTRUCTIONS>
# <프로젝트명> - Web Frontend

## 기술 스택
- Framework: <React/Vue/Angular/etc>
- Language: TypeScript
- Styling: <CSS/SCSS/Tailwind/etc>
- State: <Redux/Zustand/Pinia/etc>
- Build: <Vite/Webpack/etc>

## 디렉토리 구조
```
/
├── src/
│   ├── components/      # UI 컴포넌트
│   ├── pages/           # 페이지 컴포넌트
│   ├── hooks/           # 커스텀 훅
│   ├── stores/          # 상태 관리
│   ├── services/        # API 서비스
│   ├── utils/           # 유틸리티
│   └── types/           # 타입 정의
├── public/              # 정적 파일
└── tests/               # 테스트
```

## 개발 규칙
1. 컴포넌트는 함수형으로 작성
2. 타입 정의 필수
3. 컴포넌트당 하나의 책임
4. CSS-in-JS보다 CSS Module 또는 Tailwind 선호

## 네이밍 컨벤션
- 컴포넌트: PascalCase (`Button.tsx`)
- 훅: camelCase, use 접두사 (`useAuth.ts`)
- 유틸: camelCase (`formatDate.ts`)
- 타입: PascalCase, 접두사 없음 (`User.ts`)

## 주요 명령어
```bash
npm run dev      # 개발 서버
npm run build    # 프로덕션 빌드
npm run test     # 테스트 실행
npm run lint     # 린트 체크
```

## 테스트 규칙
- 단위 테스트: `*.test.ts(x)`
- E2E 테스트: `*.e2e.ts`
- 컴포넌트 테스트 필수
</INSTRUCTIONS>
