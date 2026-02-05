<INSTRUCTIONS>
# <프로젝트명> - Backend API

## 기술 스택
- Runtime: <Node.js/Python/Go/etc>
- Framework: <Express/FastAPI/Gin/etc>
- Database: <PostgreSQL/MongoDB/etc>
- ORM: <Prisma/SQLAlchemy/GORM/etc>

## 디렉토리 구조
```
/
├── src/
│   ├── controllers/     # 요청 핸들러
│   ├── services/        # 비즈니스 로직
│   ├── repositories/    # 데이터 액세스
│   ├── models/          # 데이터 모델
│   ├── middleware/      # 미들웨어
│   ├── routes/          # 라우트 정의
│   └── utils/           # 유틸리티
├── tests/               # 테스트
└── migrations/          # DB 마이그레이션
```

## 개발 규칙
1. 레이어드 아키텍처 준수 (Controller → Service → Repository)
2. 의존성 주입 사용
3. 에러는 미들웨어에서 중앙 처리
4. 환경 변수는 `.env`로 관리

## API 규칙
- RESTful 엔드포인트
- 응답 형식: `{ success: boolean, data?: T, error?: string }`
- 인증: Bearer Token
- 버전: `/api/v1/...`

## 주요 명령어
```bash
npm run dev       # 개발 서버 (hot reload)
npm run start     # 프로덕션 서버
npm run test      # 테스트
npm run migrate   # DB 마이그레이션
```

## 환경 변수
```
DATABASE_URL=
JWT_SECRET=
PORT=
```
</INSTRUCTIONS>
