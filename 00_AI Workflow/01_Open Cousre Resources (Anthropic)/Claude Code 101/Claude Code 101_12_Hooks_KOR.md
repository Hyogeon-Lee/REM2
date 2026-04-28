---
title: "Hook (훅)"
source: "https://anthropic.skilljar.com/claude-code-101/469798"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Hook은 Claude Code의 lifecycle의 특정 지점에서 명령을 실행하게 해줍니다. 이 과정에서 다룬 모든 것과의 주요 차이점은 hook이 **확정적(deterministic)**이라는 것입니다. 항상 실행됩니다.

## 왜 Hook을 사용하나?

Claude Code에 CLAUDE.md의 모든 파일 편집 후 Prettier를 실행하도록 말할 수 있습니다. 대부분의 경우 그럴 것입니다. 하지만 때때로 그렇지 않을 수도 있습니다. Hook은 예외 없이 매번 발생하게 합니다.

일반적인 사용 사례는 다음을 포함합니다:

- 파일 편집 후 자동 포맷팅
- 규정 준수를 위해 모든 실행된 명령 로깅
- 프로덕션 파일 수정 같은 위험한 작업 차단
- Claude가 작업을 완료할 때 자신에게 알림 전송

## 작동 원리

Hook은 `settings.json`에서 구성됩니다. 이벤트를 선택하고, 선택적으로 적용되는 도구에 대한 matcher를 설정하고, 실행할 명령을 제공합니다. 사용 가능한 이벤트는:

- **PreToolUse** — 도구 호출 전에 실행
- **PostToolUse** — 도구 호출 완료 후에 실행
- **UserPromptSubmit** — Claude가 처리하기 전에 프롬프트를 제출할 때 실행
- **Stop** — Claude가 응답을 완료할 때 실행
- **Notification** — Claude가 알림을 보낼 때 실행

Claude Code 내의 `/hooks` 명령을 통해 또는 `settings.json`을 직접 편집하여 구성합니다.

![`.claude` 디렉토리 내의 `settings.json` 파일, hook 구성을 표시합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686375%2Fvideo11settingsjsonfile.1775686375582.jpg)

## 실무 예제

가장 일반적인 hook: 편집 후 자동 포맷팅. `"Edit|MultiEdit|Write"`의 matcher를 사용하여 **PostToolUse** hook을 설정하면 Claude가 파일을 수정할 때마다 발동됩니다. 명령은 파일 확장자를 확인하고 적절한 포매터를 실행합니다. TypeScript의 경우 Prettier, Go의 경우 gofmt 등입니다.

## PreToolUse로 차단

PreToolUse hook은 도구 호출을 실행 전에 **차단**할 수 있습니다. Hook은 도구 이름과 입력을 stdin의 JSON으로 받습니다. 종료 코드는 동작을 결정합니다:

- **Exit code 0** — 정상적으로 진행합니다.
- **Exit code 2** — 행동을 차단합니다. stderr 메시지가 Claude에게 피드백으로 전달되므로 차단된 이유를 알고 조정할 수 있습니다.
- **다른 exit code** — 무언가를 중지하지 않는 오류로 표시되지만 중지되지 않습니다.

이것이 hard rule을 적용하는 방법입니다. 프로덕션 구성 디렉토리에 쓰기를 차단하세요. `rm -rf`를 포함하는 bash 명령을 차단하세요. 주(main)에 커밋을 차단하세요. 팀에 *보장*이 필요한 무엇이든지입니다. 제안이 아닙니다.

![PreToolUse와 PostToolUse hook, matcher 및 명령을 보여주는 settings.json 파일](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686375%2Fvideo11hooksblock.1775686375002.jpg)

## 팀과 함께 Hook 공유

`.claude/settings.json`에서 구성된 Hook은 프로젝트 수준이며 repo에 체크인할 수 있습니다. 이것은 팀 전체가 자동으로 동일한 hook을 가진다는 의미입니다. 프로젝트에 저장된 스크립트를 참조하기 위해 명령에서 `CLAUDE_PROJECT_DIR` 환경 변수를 사용하여 Claude의 현재 작업 디렉토리에 관계없이 작동하도록 하세요.

## 요약

Hook은 Claude Code의 동작을 deterministic하게 제어합니다. 자동 포맷팅 및 로깅의 경우 PostToolUse를 사용하세요. 위험한 작업을 차단하는 경우 PreToolUse를 사용하세요. `/hooks` 또는 `settings.json`으로 구성하세요. 그리고 팀도 사용하도록 repo에 체크인하세요.

무언가가 실패 없이 매번 발생해야 한다면 프롬프트에 넣지 마세요. Hook에 넣으세요.
