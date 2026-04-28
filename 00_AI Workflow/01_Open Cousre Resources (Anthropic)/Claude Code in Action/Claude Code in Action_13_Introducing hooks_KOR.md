---
title: "Introducing hooks"
source: "https://anthropic.skilljar.com/claude-code-in-action/312000"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## Hook(훅) 소개

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Hook(훅)을 사용하면 Claude가 도구를 실행하기 전이나 후에 명령을 실행할 수 있습니다. 파일 편집 후 코드 포맷터 실행, 파일 변경 시 테스트 실행 또는 특정 파일에 대한 액세스 차단 같은 자동화된 워크플로를 구현하는 데 매우 유용합니다.

## Hook의 작동 방식

Hook을 이해하려면 먼저 Claude Code와 상호 작용할 때의 일반적인 흐름을 살펴봅시다. Claude에게 무언가를 요청하면 Claude 모델과 함께 도구 정의가 포함된 쿼리가 전송됩니다. Claude가 형식화된 응답을 제공하여 도구를 사용하기로 결정할 수 있으며, Claude Code는 해당 도구를 실행하고 결과를 반환합니다.

Hook은 이 프로세스에 자신을 삽입하여 도구 실행 바로 전이나 후에 코드를 실행할 수 있게 합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618158%2F010_-_Introducing_Hooks_06.1752618158162.png)

두 가지 유형의 Hook이 있습니다:

- **PreToolUse Hook(사전 도구 사용 훅)** - 도구가 호출되기 전에 실행
- **PostToolUse Hook(사후 도구 사용 훅)** - 도구가 호출된 후 실행

## Hook 구성

Hook은 Claude 설정 파일에 정의됩니다. 다음에 추가할 수 있습니다:

- **전역** - `~/.claude/settings.json`(모든 프로젝트 영향)
- **프로젝트** - `.claude/settings.json`(팀과 공유)
- **프로젝트(커밋되지 않음)** - `.claude/settings.local.json`(개인 설정)

이 파일에 직접 Hook을 작성하거나 Claude Code 내에서 `/hooks` 명령을 사용할 수 있습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618158%2F010_-_Introducing_Hooks_07.1752618158600.png)

구성 구조에는 두 가지 주요 섹션이 포함됩니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618159%2F010_-_Introducing_Hooks_10.1752618159645.png)

## PreToolUse Hook

PreToolUse Hook은 도구가 실행되기 전에 실행됩니다. 이들은 대상으로 할 도구 유형을 지정하는 matcher(매칭기)를 포함합니다:

```js
"PreToolUse": [
  {
    "matcher": "Read",
    "hooks": [
      {
        "type": "command",
        "command": "node /home/hooks/read_hook.ts"
      }
    ]
  }
]
```

'Read' 도구가 실행되기 전에 이 구성은 지정된 명령을 실행합니다. 명령은 Claude가 수행하려고 하는 도구 호출에 대한 세부 정보를 받고 다음을 수행할 수 있습니다:

- 작업이 정상적으로 진행되도록 허용
- 도구 호출을 차단하고 Claude에 오류 메시지 전송

## PostToolUse Hook

PostToolUse Hook은 도구가 실행된 후 실행됩니다. 다음은 쓰기, 편집 또는 다중 편집 작업 후 트리거하는 예입니다:

```js
"PostToolUse": [
  {
    "matcher": "Write|Edit|MultiEdit",
    "hooks": [
      {
        "type": "command", 
        "command": "node /home/hooks/edit_hook.ts"
      }
    ]
  }
]
```

도구 호출이 이미 발생했으므로 PostToolUse Hook은 작업을 차단할 수 없습니다. 그러나 다음을 수행할 수 있습니다:

- 후속 작업 실행(방금 편집한 파일 형식화 같은)
- 도구 사용에 대해 Claude에게 추가 피드백 제공

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618160%2F010_-_Introducing_Hooks_15.1752618160073.png)

## 실제 응용

Hook을 사용하는 몇 가지 일반적인 방법은 다음과 같습니다:

- **코드 형식화** - Claude가 편집한 후 파일을 자동으로 형식화합니다
- **테스트** - 파일이 변경될 때 자동으로 테스트를 실행합니다
- **액세스 제어** - Claude가 특정 파일을 읽거나 편집하지 못하도록 차단합니다
- **코드 품질** - Linter 또는 타입 체크 실행 및 Claude에 피드백 제공
- **로깅** - Claude가 액세스하거나 수정하는 파일 추적
- **검증** - 명명 규칙 또는 코딩 표준 확인

핵심은 Hook이 자신의 도구와 프로세스를 워크플로에 통합하여 Claude Code의 기능을 확장할 수 있게 해준다는 것입니다. PreToolUse Hook은 Claude가 할 수 있는 것을 제어하고, PostToolUse Hook은 Claude가 한 일을 향상하게 합니다.
