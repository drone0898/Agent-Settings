# MCP 서버 모듈러 플러그인 아키텍처

> **출처**: [fcakyon/claude-codex-settings](https://github.com/fcakyon/claude-codex-settings)

## 개요

17+ MCP(Model Context Protocol) 서버를 모듈러 방식으로 통합하는 플러그인 아키텍처입니다.

## 사용 가능한 MCP 서버

| 플러그인 | 설명 |
|---------|------|
| `azure-tools` | Azure 클라우드 서비스 통합 |
| `github-dev` | GitHub API 통합 |
| `mongodb-tools` | MongoDB 데이터베이스 작업 |
| `playwright-tools` | 브라우저 자동화 |
| `slack-tools` | Slack 메시지 및 채널 관리 |
| `supabase-tools` | Supabase 백엔드 서비스 |
| `paper-search-tools` | 학술 논문 검색 |

## 도구 명명 규칙

```
mcp__plugin_<name>_<server>__<tool-name>
```

예시:
```
mcp__plugin_github_dev__create_issue
mcp__plugin_mongodb__find_documents
```

## 장점

- **선택적 설치**: 필요한 플러그인만 설치
- **컨텍스트 절약**: 미사용 플러그인은 로드하지 않음
- **표준 인터페이스**: 일관된 도구 접근 방식

## 활용

외부 서비스와의 통합이 필요할 때:
1. 필요한 MCP 플러그인 설치
2. 자동으로 도구가 등록됨
3. 표준 도구 호출 방식으로 사용

## 참고 링크

- [원본 레포지토리](https://github.com/fcakyon/claude-codex-settings)
- [MCP 공식 문서](https://modelcontextprotocol.io/)
