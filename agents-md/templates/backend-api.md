<INSTRUCTIONS>
# <프로젝트명> - Backend API

Prefer retrieval-led reasoning over pre-training-led reasoning.

## 문서 인덱스
| 경로 | 용도 |
|------|------|
| src/controllers/ | 요청 핸들러 |
| src/services/ | 비즈니스 로직 |
| src/repositories/ | 데이터 액세스 |
| src/models/ | 데이터 모델 |
| src/middleware/ | 미들웨어 |
| src/routes/ | 라우트 정의 |
| migrations/ | DB 마이그레이션 |

## 기술 스택
Runtime: <Node.js/Python/Go> | Framework: <Express/FastAPI/Gin> | DB: <PostgreSQL/MongoDB>

## 핵심 규칙
- 레이어드 아키텍처: Controller → Service → Repository
- API: RESTful, Bearer Token, `/api/v1/...`
- 응답: `{ success, data?, error? }`

## 명령어
| 명령 | 용도 |
|------|------|
| `npm run dev` | 개발 서버 |
| `npm run start` | 프로덕션 |
| `npm run test` | 테스트 |
| `npm run migrate` | 마이그레이션 |

## 환경 변수
DATABASE_URL, JWT_SECRET, PORT
</INSTRUCTIONS>
