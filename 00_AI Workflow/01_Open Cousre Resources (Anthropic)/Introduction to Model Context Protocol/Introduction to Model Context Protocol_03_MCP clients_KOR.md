---
title: "MCP 클라이언트"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296690"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## MCP 클라이언트

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

MCP client(클라이언트)는 여러분의 서버와 MCP server 사이의 통신 브리지 역할을 합니다. MCP server가 제공하는 모든 도구에 접근하는 진입점이며, 애플리케이션이 직접 처리할 필요가 없도록 메시지 교환과 프로토콜 세부 사항을 대신 처리합니다.

## Transport(전송 계층)에 구애받지 않는 통신

MCP의 핵심 강점 중 하나는 transport에 구애받지 않는다는 점입니다. 다소 거창하게 들리지만, 결국 client와 server가 환경 설정에 따라 서로 다른 프로토콜을 통해 통신할 수 있다는 의미입니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849223%2F09_-_002_-_MCP_Clients_01.1749849223245.png)

가장 일반적인 구성은 MCP client와 server를 동일한 머신에서 실행하면서 표준 입력/출력(standard input/output)을 통해 통신하도록 하는 방식입니다. 하지만 다음과 같은 방식으로 연결할 수도 있습니다.

- HTTP
- WebSockets
- 기타 다양한 네트워크 프로토콜

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849224%2F09_-_002_-_MCP_Clients_03.1749849223875.png)

## MCP 메시지 타입

연결이 완료되면 client와 server는 MCP 사양(specification)에 정의된 특정 메시지 타입들을 주고받습니다. 주로 다루게 될 메시지는 다음과 같습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849224%2F09_-_002_-_MCP_Clients_05.1749849224367.png)

**ListToolsRequest/ListToolsResult:** client가 server에게 "어떤 도구들을 제공하나요?"라고 묻고, 사용 가능한 도구 목록을 응답으로 받습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849225%2F09_-_002_-_MCP_Clients_07.1749849224854.png)

**CallToolRequest/CallToolResult:** client가 server에게 특정 도구를 주어진 인수와 함께 실행하도록 요청하고, 그 결과를 받습니다.

## 모든 것이 함께 작동하는 방식

다음은 사용자 쿼리가 전체 시스템을 어떻게 흘러가는지를 보여주는 완전한 예제입니다. 여러분의 서버에서 시작해 MCP client를 거쳐 GitHub와 같은 외부 서비스로 갔다가 다시 Claude로 되돌아오는 과정입니다.

사용자가 "What repositories do I have?(내가 가지고 있는 리포지토리는 무엇인가?)"라고 물었다고 가정해 봅시다. 단계별 흐름은 다음과 같습니다.

1. **사용자 쿼리(User Query):** 사용자가 여러분의 서버에 질문을 보냅니다.
2. **도구 탐색(Tool Discovery):** 여러분의 서버는 Claude에게 어떤 도구들이 사용 가능한지 알려 주어야 합니다.
3. **도구 목록 교환(List Tools Exchange):** 여러분의 서버가 MCP client에게 사용 가능한 도구 목록을 요청합니다.
4. **MCP 통신(MCP Communication):** MCP client가 MCP server에 `ListToolsRequest`를 보내고 `ListToolsResult`를 응답으로 받습니다.
5. **Claude 요청(Claude Request):** 여러분의 서버가 사용자의 쿼리와 사용 가능한 도구 목록을 Claude에게 보냅니다.
6. **도구 사용 결정(Tool Use Decision):** Claude는 질문에 답하기 위해 도구를 호출해야겠다고 판단합니다.
7. **도구 실행 요청(Tool Execution Request):** 여러분의 서버가 MCP client에게 Claude가 지정한 도구를 실행해 달라고 요청합니다.
8. **외부 API 호출(External API Call):** MCP client가 MCP server에 `CallToolRequest`를 보내고, MCP server가 실제 GitHub API 호출을 수행합니다.
9. **결과 역방향 전달(Results Flow Back):** GitHub가 리포지토리 데이터로 응답하고, 이 데이터는 MCP server를 거쳐 `CallToolResult` 형태로 되돌아옵니다.
10. **Claude로 도구 결과 전달(Tool Result to Claude):** 여러분의 서버가 도구 결과를 다시 Claude에게 전달합니다.
11. **최종 응답(Final Response):** Claude가 리포지토리 데이터를 활용해 최종 답변을 구성합니다.
12. **사용자가 답변 수신(User Gets Answer):** 여러분의 서버가 Claude의 응답을 사용자에게 다시 전달합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849232%2F09_-_002_-_MCP_Clients_19.1749849231568.png)

네, 이 흐름은 많은 단계를 포함하지만, 각 구성 요소는 명확한 책임을 갖습니다. MCP client는 server와의 통신 복잡성을 추상화해 주므로, 강력한 외부 도구 및 데이터 소스에 대한 접근성을 유지하면서도 여러분은 애플리케이션 로직에 집중할 수 있습니다.

이 흐름을 이해하는 것이 중요한데, 이후 섹션에서 직접 MCP client와 server를 구축할 때 이 모든 요소들을 다시 마주하게 되기 때문입니다.
