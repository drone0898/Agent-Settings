<INSTRUCTIONS>
# <프로젝트명> - Mobile App

Prefer retrieval-led reasoning over pre-training-led reasoning.

## 문서 인덱스
| 경로 | 용도 |
|------|------|
| src/screens/ | 화면 컴포넌트 |
| src/components/ | 재사용 컴포넌트 |
| src/navigation/ | 네비게이션 설정 |
| src/services/ | API 서비스 |
| src/stores/ | 상태 관리 |
| android/ | Android 네이티브 |
| ios/ | iOS 네이티브 |

## 기술 스택
Framework: <React Native/Flutter> | <TypeScript/Dart> | Navigation: <React Navigation>

## 핵심 규칙
- 화면과 컴포넌트 분리
- 플랫폼별 코드: `.android.ts`, `.ios.ts`
- 화면: PascalCase + Screen (`HomeScreen.tsx`)

## 명령어
| 명령 | 용도 |
|------|------|
| `npm run start` | Metro 서버 |
| `npm run android` | Android 실행 |
| `npm run ios` | iOS 실행 |
| `npm run test` | 테스트 |

## 배포 체크리스트
버전 업데이트 | 환경 변수 | 앱 아이콘 | 권한 설정
</INSTRUCTIONS>
