---
title: "Implementing a hook"
source: "https://anthropic.skilljar.com/claude-code-in-action/312003"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## Hook(훅) 구현하기

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Claude가 .env 같은 민감한 파일을 읽지 못하도록 막는 사용자 정의 Hook(훅)을 구축해 봅시다. 이것은 개발 세션 중에 환경 변수 및 기타 기밀 데이터를 보호하는 방법의 실제 예입니다.

## Hook 구성 설정

먼저 설정 파일에서 Hook을 구성해야 합니다. `.claude/settings.local.json` 파일을 열고 hooks 섹션을 찾습니다. 도구 호출이 실행되기 전에 가로채려고 하므로 PreToolUse Hook을 생성합니다.

구성에는 두 가지 핵심이 필요합니다:

- **Matcher(매칭기)** - 감시할 도구 지정
- **Command(명령)** - 이러한 도구가 호출될 때 실행되는 스크립트

매칭기의 경우 .env 파일에 액세스할 수 있는 읽기 및 grep 작업을 모두 포함하려고 합니다:

```js
"matcher": "Read|Grep"
```

파이프 기호(|)는 OR 연산자로 작동하므로 두 도구 중 하나에서 트리거됩니다. 명령의 경우 Node.js 스크립트를 가리킵니다:

```js
"command": "node ./hooks/read_hook.js"
```

## 도구 호출 데이터 이해하기

Claude가 도구를 사용하려고 시도하면 Hook은 표준 입력을 통해 JSON으로 해당 호출에 대한 자세한 정보를 수신합니다. 이 데이터에는 다음이 포함됩니다:

- 세션 ID 및 트랜스크립트 경로
- Hook 이벤트 이름(이 경우 PreToolUse)
- 도구 이름(Read, Grep 등)
- 파일 경로를 포함한 도구 입력 매개변수

Hook 스크립트는 이 데이터를 처리하고 특정 종료 코드로 종료함으로써 작업을 계속 진행시키거나 차단할 수 있습니다.

## Hook 스크립트 구현

Hook 스크립트는 표준 입력에서 도구 호출 데이터를 읽고 Claude가 .env 파일에 액세스하려는 시도가 있는지 확인해야 합니다. 핵심 로직은 다음과 같습니다:

```js
async function main() {
  const chunks = [];
  for await (const chunk of process.stdin) {
    chunks.push(chunk);
  }
  
  const toolArgs = JSON.parse(Buffer.concat(chunks).toString());
  
  // Claude가 읽으려는 파일 경로 추출
  const readPath = 
    toolArgs.tool_input?.file_path || toolArgs.tool_input?.path || "";
  
  // Claude가 .env 파일을 읽으려는 시도가 있는지 확인
  if (readPath.includes('.env')) {
    console.error("You cannot read the .env file");
    process.exit(2);
  }
}
```

스크립트는 파일 경로에서 .env를 확인하고 발견되면 작업을 차단합니다. 코드 2로 종료하면 Claude는 오류 메시지를 받고 작업이 Hook에 의해 차단되었음을 이해합니다.

## Hook 테스트하기

구성과 Hook 스크립트를 저장한 후 변경 사항을 적용하려면 Claude Code를 다시 시작합니다. 그런 다음 Claude에게 .env 파일을 읽도록 요청하여 테스트합니다.

Claude가 읽기 작업을 시도할 때 Hook이 이를 가로채서 오류 메시지를 반환합니다. Claude는 작업이 차단되었음을 인식하고 이를 설명하며, 종종 read hook이 파일에 대한 액세스를 막았다고 언급합니다.

동일한 보호는 grep 작업에도 적용됩니다. Claude가 .env 파일 내에서 검색하려고 시도하면 Hook이 그것도 차단합니다.

## 핵심 이점

이 방법은 여러 가지 장점을 제공합니다:

- **사전 보호** - 민감한 데이터를 읽기 전에 액세스 차단
- **투명한 작동** - Claude는 작업이 실패한 이유를 이해합니다
- **유연한 매칭** - 여러 도구(read, grep 등)와 작동
- **명확한 피드백** - 의미 있는 오류 메시지 제공

이 특정 예는 .env 파일에 초점을 맞추고 있지만, 동일한 패턴이 프로젝트의 모든 민감한 파일이나 디렉토리를 보호할 수 있습니다. 여러 파일 패턴을 확인하거나 보안 요구에 따라 더 정교한 액세스 제어를 구현하기 위해 로직을 확장할 수 있습니다.
