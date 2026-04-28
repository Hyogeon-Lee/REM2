---
title: "Another useful hook"
source: "https://anthropic.skilljar.com/claude-code-in-action/312427"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  

## 또 다른 유용한 Hook(훅)

이 코스에서 논의한 `PreToolUse` 및 `PostToolUse` Hook 외에도 다음과 같은 Hook들이 있습니다:

- `Notification` - Claude Code가 알림을 전송할 때 실행됩니다. 이는 Claude가 도구 사용 권한이 필요하거나 Claude Code가 60초 동안 유휴 상태였을 때 발생합니다
- `Stop` - Claude Code가 응답을 완료했을 때 실행됩니다
- `SubagentStop` - subagent(서브 에이전트, UI에서는 "Task"로 표시됨)가 완료되었을 때 실행됩니다
- `PreCompact` - compact(합치기) 작업이 수동 또는 자동으로 발생하기 전에 실행됩니다
- `UserPromptSubmit` - 사용자가 프롬프트를 제출할 때, Claude가 그것을 처리하기 전에 실행됩니다
- `SessionStart` - 세션을 시작하거나 재개할 때 실행됩니다
- `SessionEnd` - 세션이 끝날 때 실행됩니다

**혼동스러운 부분은 다음과 같습니다:**

1. 명령에 대한 stdin 입력은 실행되는 Hook 유형(`PreToolUse`, `PostToolUse`, `Notification` 등)에 따라 변경됩니다
2. 그 안에 포함된 `tool_input`은 호출된 도구에 따라 달라집니다(`PreToolUse` 및 `PostToolUse` Hook의 경우)

예를 들어, 다음은 `TodoWrite` 도구의 사용을 감시하는 `PostToolUse` Hook에 대한 stdin 입력의 샘플입니다. 참고로 그것은 Claude가 할 일 목록을 추적하는 데 사용하는 도구입니다.

```javascript
{
  "session_id": "9ecf22fa-edf8-4332-ae85-b6d5456eda64",
  "transcript_path": "<path_to_transcript>",
  "hook_event_name": "PostToolUse",
  "tool_name": "TodoWrite",
  "tool_input": {
    "todos": [{ "content": "write a readme", "status": "pending", "priority": "medium", "id": "1" }]
  },
  "tool_response": {
    "oldTodos": [],
    "newTodos": [{ "content": "write a readme", "status": "pending", "priority": "medium", "id": "1" }]
  }
}
```

비교를 위해, 다음은 `Stop` Hook (훅)에 대한 입력의 예입니다:

```javascript
{
  "session_id": "af9f50b6-f042-4773-b3e2-c3a4814765ce",
  "transcript_path": "<path_to_transcript>",
  "hook_event_name": "Stop",
  "stop_hook_active": false
}
```

**보시다시피, 명령에 대한 stdin 입력은 Hook (훅)(`PreToolUse`, `PostToolUse`, `Stop` 등) *및* 사용된 매칭기(`PreToolUse` 및 `PostToolUse`의 경우)에 따라 크게 다릅니다. 이는 Hook (훅) 작성을 어렵게 할 수 있습니다. 명령에 대한 입력의 정확한 구조를 모를 수 있습니다!**

이 챌린지를 처리하기 위해 다음과 같은 헬퍼 Hook (훅)을 만들어 보세요:

```javascript
"PostToolUse": [ // 또는 "PreToolUse" 또는 "Stop" 등
  {
    "matcher": "*",
    "hooks": [
      {
        "type": "command",
        "command": "jq . > post-log.json"
      }
    ]
  },
]
```

제공된 명령을 주목합니다. 이 Hook (훅)에 대한 입력을 `post-log.json` 파일에 기록하여 명령에 피드되었을 정확한 내용을 검사할 수 있습니다! **이를 통해 명령이 검사해야 할 데이터를 훨씬 더 쉽게 이해할 수 있습니다.**
