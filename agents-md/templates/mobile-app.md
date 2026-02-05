<INSTRUCTIONS>
# <프로젝트명> - Mobile App

## 기술 스택
- Framework: <React Native/Flutter/etc>
- Language: <TypeScript/Dart/etc>
- State: <Redux/Provider/etc>
- Navigation: <React Navigation/etc>

## 디렉토리 구조
```
/
├── src/
│   ├── screens/         # 화면 컴포넌트
│   ├── components/      # 재사용 컴포넌트
│   ├── navigation/      # 네비게이션 설정
│   ├── services/        # API 서비스
│   ├── stores/          # 상태 관리
│   ├── hooks/           # 커스텀 훅
│   └── utils/           # 유틸리티
├── android/             # Android 네이티브
├── ios/                 # iOS 네이티브
└── tests/               # 테스트
```

## 개발 규칙
1. 화면과 컴포넌트 분리
2. 플랫폼별 코드는 `.android.ts`, `.ios.ts` 사용
3. 네이티브 모듈은 별도 래퍼로 추상화
4. 앱 상태와 서버 상태 분리

## 네이밍 컨벤션
- 화면: PascalCase + Screen (`HomeScreen.tsx`)
- 컴포넌트: PascalCase (`Button.tsx`)
- 스타일: 컴포넌트와 같은 파일 또는 `.styles.ts`

## 주요 명령어
```bash
# 개발
npm run start            # Metro 서버
npm run android          # Android 실행
npm run ios              # iOS 실행

# 빌드
npm run build:android    # Android 빌드
npm run build:ios        # iOS 빌드

# 테스트
npm run test             # 단위 테스트
```

## 배포 체크리스트
- [ ] 버전 번호 업데이트
- [ ] 환경 변수 확인
- [ ] 앱 아이콘/스플래시 확인
- [ ] 권한 설정 확인
</INSTRUCTIONS>
