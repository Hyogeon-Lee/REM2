---
title: "클라이언트 구현"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296696"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## 클라이언트 구현

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

이제 MCP server가 동작하므로, 클라이언트(client) 쪽을 구축할 차례입니다. client는 애플리케이션 코드가 MCP server와 통신하면서 server의 기능에 접근할 수 있도록 해 주는 구성 요소입니다.

## Client 아키텍처 이해하기

대부분의 실제 프로젝트에서는 MCP client 아니면 MCP server 중 하나만 구현하지, 둘 다 구현하지는 않습니다. 이 프로젝트에서 둘 다 만들어 보는 것은 단지 두 컴포넌트가 어떻게 함께 동작하는지 보여 주기 위함입니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849285%2F09_-_006_-_Implementing_a_Client_01.1749849285296.png)

MCP client는 두 가지 주요 컴포넌트로 구성됩니다.

- **MCP Client(MCP 클라이언트)** — 세션(session)을 더 쉽게 사용하기 위해 우리가 직접 정의하는 커스텀 클래스
- **Client Session(클라이언트 세션)** — server에 대한 실제 연결 객체(MCP Python SDK에 포함된 부분)
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849286%2F09_-_006_-_Implementing_a_Client_02.1749849285884.png)

ClientSession은 세심한 리소스 관리가 필요합니다. 사용을 마쳤을 때 연결을 적절히 정리(clean up)해야 하기 때문입니다. 그래서 모든 정리 작업을 자동으로 처리해 주는 우리만의 클래스로 ClientSession을 감싸 줍니다.

## Client가 애플리케이션과 어떻게 맞물리는가

앞서 본 애플리케이션 흐름 다이어그램을 기억하시나요? client는 우리 코드가 다음의 두 가지 핵심 지점에서 MCP server와 상호작용할 수 있게 해 줍니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849286%2F09_-_006_-_Implementing_a_Client_06.1749849286672.png)

우리의 CLI 코드는 client를 다음과 같이 사용합니다.

- Claude에게 보낼 사용 가능한 도구 목록을 가져옴
- Claude가 도구 호출을 요청하면 해당 도구를 실행함

## 핵심 client 함수 구현하기

다음 두 가지 핵심 함수를 구현해야 합니다. `list_tools()`와 `call_tool()`입니다.

### List Tools 함수

이 함수는 MCP server에서 사용 가능한 모든 도구를 가져옵니다.

```js
async def list_tools(self) -> list[types.Tool]:
    result = await self.session().list_tools()
    return result.tools
```

매우 단순합니다. 세션(server에 대한 연결)에 접근하여 내장 `list_tools()` 메서드를 호출한 뒤, 결과에서 tools를 꺼내어 반환합니다.

### Call Tool 함수

이 함수는 server에서 특정 도구를 실행합니다.

```js
async def call_tool(
    self, tool_name: str, tool_input: dict
) -> types.CallToolResult | None:
    return await self.session().call_tool(tool_name, tool_input)
```

Claude가 제공한 도구 이름과 입력 매개변수를 server에 전달한 뒤, 그 결과를 반환합니다.

## Client 테스트하기

client 파일 하단에는 간단한 테스트 하네스(test harness)가 포함되어 있습니다. 이를 직접 실행하여 모든 것이 정상적으로 동작하는지 확인할 수 있습니다.

```js
uv run mcp_client.py
```

이 명령은 MCP server에 연결하고 사용 가능한 도구들을 출력합니다. 설명(description)과 입력 스키마(input schema)를 포함한 도구 정의가 출력으로 표시되어야 합니다.

## 모두 합쳐 보기(Putting It All Together)

client 함수 구현이 끝나면, 메인 애플리케이션을 실행하여 전체 흐름을 테스트할 수 있습니다.

```js
uv run main.py
```

다음과 같이 질문해 보세요. "What is the contents of the report.pdf document?(report.pdf 문서의 내용이 무엇인가요?)"

내부적으로는 다음과 같은 과정이 일어납니다.

1. 애플리케이션이 client를 사용해 사용 가능한 도구 목록을 가져옵니다.
2. 가져온 도구 목록과 사용자의 질문이 함께 Claude에게 전송됩니다.
3. Claude는 read\_doc\_contents 도구를 사용하기로 결정합니다.
4. 애플리케이션이 client를 통해 해당 도구를 실행합니다.
5. 실행 결과가 Claude에게 전달되고, Claude가 그 결과를 바탕으로 사용자에게 응답합니다.

Client는 애플리케이션 로직과 MCP server의 기능 사이를 연결하는 브리지 역할을 하므로, 강력한 도구들을 AI 워크플로우에 손쉽게 통합할 수 있습니다.
