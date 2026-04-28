---
title: "Defining hooks"
source: "https://anthropic.skilljar.com/claude-code-in-action/312002"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)

[

**2**  
다운로드

](#)

## Hook(훅) 정의하기

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Claude Code의 Hook(훅)을 사용하면 도구 호출이 실행되기 전이나 후에 이를 가로채서 제어할 수 있습니다. 이를 통해 개발 환경에서 Claude가 수행할 수 있는 작업을 세밀하게 제어할 수 있습니다.

## Hook 구축

Hook을 생성하는 데는 네 가지 주요 단계가 포함됩니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618153%2F011_-_Defining_Hooks_05.1752618152864.png)

1. **PreToolUse 또는 PostToolUse Hook 결정** - PreToolUse Hook은 도구 호출 실행을 방지할 수 있지만 PostToolUse Hook은 도구가 이미 사용된 후 실행
2. **감시하려는 도구 호출 유형 결정** - 어떤 도구가 Hook을 트리거해야 하는지 정확히 지정해야 합니다
3. **도구 호출을 받을 명령 작성** - 이 명령은 표준 입력을 통해 제안된 도구 호출에 대한 JSON 데이터를 받습니다
4. **필요한 경우 명령이 Claude에 피드백 제공** - 명령의 종료 코드는 작업을 허용하거나 차단할지를 Claude에 알립니다

## 사용 가능한 도구

Claude Code는 Hook으로 모니터링할 수 있는 여러 내장 도구를 제공합니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618153%2F011_-_Defining_Hooks_07.1752618153492.png)

현재 설정에서 정확히 사용 가능한 도구를 보려면 Claude에게 직접 목록을 요청할 수 있습니다. 이는 사용자 정의 MCP 서버를 추가할 때 사용 가능한 도구가 변경될 수 있으므로 특히 유용합니다.

## 도구 호출 데이터 구조

Hook 명령이 실행되면 Claude는 제안된 도구 호출에 대한 세부 정보를 포함하는 JSON 데이터를 표준 입력을 통해 보냅니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618154%2F011_-_Defining_Hooks_11.1752618154320.png)

```js
{
  "session_id": "2d6a1e4d-6...",
  "transcript_path": "/Users/sg/...",
  "hook_event_name": "PreToolUse",
  "tool_name": "Read",
  "tool_input": {
    "file_path": "/code/queries/.env"
  }
}
```

명령은 표준 입력에서 이 JSON을 읽고 파싱한 다음 도구 이름 및 입력 매개변수를 기반으로 작업을 허용하거나 차단할지를 결정합니다.

## 종료 코드 및 제어 흐름

Hook 명령은 종료 코드를 통해 Claude에 다시 정보를 전달합니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618154%2F011_-_Defining_Hooks_16.1752618154725.png)

- **종료 코드 0** - 모든 것이 좋음, 도구 호출이 계속 진행될 수 있음
- **종료 코드 2** - 도구 호출 차단(PreToolUse Hook만 해당)

PreToolUse Hook에서 코드 2로 종료하면 표준 오류에 기록한 모든 오류 메시지가 작업이 차단된 이유를 설명하는 피드백으로 Claude에 전송됩니다.

## 예제 사용 사례

일반적인 사용 사례는 Claude가 `.env` 파일과 같은 민감한 파일을 읽지 못하도록 막는 것입니다. `Read` 및 `Grep` 도구 모두 파일 내용에 액세스할 수 있으므로, 두 도구 유형을 모두 모니터링하면서 제한된 파일 경로에 접근하려고 시도하는지 확인해야 합니다.

이 방법을 사용하면 명확한 피드백을 제공하면서 Claude의 파일 시스템 액세스를 완전히 제어할 수 있습니다.

#### 다운로드

- [queries.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1773097175/queries.zip?response-content-disposition=attachment&Expires=1777368009&Signature=o34ZkdiBm9jY30YlQQ2HX0X3YU~r8vCEhhFncOVJJE2WDN2EVaFfpcoPZS5WAXYe6gk3mv~K9tg5obe2~JySqtllNOIMRqk2LoiPJtDLDCovPeuVleUeOgNsqhklbGg0fPeC07Wzg7IiBKjinCCMmVI82tZM5OTxZUmYpSdNv~lVZchmMCRFt8JHIWK55vVu8RBwiP5ulmm5U-U4ms9VZsrky6DtkMWqt6Z00oq3AKNJGKs0t3mztYqqZ68-KSG4NcJB-j4wYeJz8YTl2RKJqzPA5HVJMWqv5WjOT-OKNB5wdTfa~xc-Cft2257BEst319L2F074E-P1rmNC7c6gSA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [queries\_COMPLETED.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1773097185/queries_COMPLETED.zip?response-content-disposition=attachment&Expires=1777368009&Signature=u92LxZMT8WN5hsePHB0ldHsFVxNMmX28z47tcvmxlaQ~gmRb9HCpU9IFkI66wBh2AiH~Jp5AMODEpHU25E-jKbedAGuu8YOGinYRXWrgkFeUyi6Zrr8zEEHSfIjbo2~De8r-EPyQRFH3GbWE~RJJDVvtOwz9rzdajbcSnDgVdqAl2x-gnRFOWbdRi6r2qam4UiOHzHg1stQD8hR3LWhsGe5fFmlz3TJJ4XUYnMa4xnWDglJAW7QT0MKIKZP6Ef7udm8PrjC~Yg0XHxQ9HZW5MMpf4OAlB64PQ0XVMj7nYgrWARZr~-rXeicHwXLO9o882hPY3OmK9lWf6Sd~PBHGgw__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
