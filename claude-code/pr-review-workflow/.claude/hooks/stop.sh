#!/bin/bash
# Stop Hook - 작업 종료 시 /pr-workflow 자동 실행

# 변경사항이 있을 때만 /pr-workflow 실행
if [ -n "$(git status --porcelain)" ]; then
  echo '{"decision": "block", "reason": "/pr-workflow"}'
else
  echo '{"decision": "approve"}'
fi
