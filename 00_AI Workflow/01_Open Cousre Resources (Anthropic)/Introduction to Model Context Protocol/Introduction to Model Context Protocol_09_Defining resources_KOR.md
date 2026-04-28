---
title: "리소스 정의"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296699"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## 리소스 정의

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

MCP server의 resource(리소스)를 사용하면 client에 데이터를 노출할 수 있는데, 이는 일반적인 HTTP server의 GET 요청 핸들러(handler)와 유사합니다. 어떤 동작(action)을 수행하기보다 정보를 가져와야 하는 시나리오에 적합합니다.

## 예제를 통한 resource 이해하기

사용자가 `@document_name` 형식으로 입력하여 파일을 참조할 수 있는 "문서 멘션(mention)" 기능을 만든다고 가정해 봅시다. 이 기능에는 두 가지 작업이 필요합니다.

- 사용 가능한 모든 문서 목록 가져오기(자동 완성용)
- 특정 문서가 멘션됐을 때 해당 문서의 내용 가져오기

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849287%2F09_-_007_-_Defining_Resources_01.1749849287240.png)

사용자가 문서를 멘션하면 시스템은 문서의 내용을 Claude로 전송되는 프롬프트에 자동으로 주입하여 Claude가 도구를 사용하여 정보를 가져올 필요가 없습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849287%2F09_-_007_-_Defining_Resources_02.1749849287776.png)

## 리소스가 작동하는 방식

리소스는 요청-응답 패턴을 따릅니다. 클라이언트가 데이터가 필요할 때, 어떤 리소스를 원하는지 식별하는 URI를 포함하는 `ReadResourceRequest`를 보냅니다. MCP 서버는 이 요청을 처리하고 `ReadResourceResult`에서 데이터를 반환합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849288%2F09_-_007_-_Defining_Resources_05.1749849288268.png)

흐름은 다음과 같습니다: 코드가 MCP 클라이언트에서 리소스를 요청하면, MCP 서버에 요청을 전달합니다. 서버는 URI를 처리하고, 적절한 함수를 실행하고, 결과를 반환합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849289%2F09_-_007_-_Defining_Resources_06.1749849288783.png)

## 리소스 타입

두 가지 유형의 리소스가 있습니다:

### 직접 리소스

직접 리소스는 절대 변하지 않는 정적 URI를 가집니다. 매개변수가 필요 없는 작업에 완벽합니다.

```js
@mcp.resource(
    "docs://documents",
    mime_type="application/json"
)
def list_docs() -> list[str]:
    return list(docs.keys())
```

### 템플릿 리소스

템플릿 리소스는 URI에 매개변수를 포함합니다. Python SDK는 이러한 매개변수를 자동으로 파싱하고 키워드 인수로 함수에 전달합니다.

```js
@mcp.resource(
    "docs://documents/{doc_id}",
    mime_type="text/plain"
)
def fetch_doc(doc_id: str) -> str:
    if doc_id not in docs:
        raise ValueError(f"Doc with id {doc_id} not found")
    return docs[doc_id]
```

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849289%2F09_-_007_-_Defining_Resources_07.1749849289476.png)

## 구현 세부 사항

리소스는 문자열, JSON, 바이너리 데이터 등 모든 유형의 데이터를 반환할 수 있습니다. 반환할 데이터의 종류를 클라이언트에 힌트하기 위해 `mime_type` 매개변수를 사용합니다:

- 구조화된 데이터의 경우 `"application/json"`
- 일반 텍스트의 경우 `"text/plain"`
- 바이너리 파일의 경우 `"application/pdf"`

MCP Python SDK는 반환 값을 자동으로 직렬화합니다. 객체를 JSON 문자열로 수동으로 변환할 필요가 없습니다. 데이터 구조를 반환하면 SDK가 직렬화를 처리합니다.

## 리소스 테스트

MCP Inspector를 사용하여 리소스를 테스트할 수 있습니다. 다음과 같이 서버를 시작합니다:

```js
uv run mcp dev mcp_server.py
```

그런 다음 브라우저에서 검사기에 연결합니다. 두 가지 섹션을 볼 수 있습니다:

- **Resources (리소스)** - 직접/정적 리소스 나열
- **Resource Templates (리소스 템플릿)** - 템플릿 리소스 나열

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849290%2F09_-_007_-_Defining_Resources_18.1749849290021.png)

리소스를 클릭하여 테스트합니다. 템플릿 리소스의 경우 매개변수 값을 제공해야 합니다. 검사기는 클라이언트가 수신할 정확한 응답 구조(MIME 타입 및 직렬화된 데이터 포함)를 보여줍니다.

리소스는 MCP 서버에서 읽기 전용 데이터를 노출하는 깔끔한 방법을 제공하여 클라이언트가 도구 호출의 복잡성 없이 정보를 쉽게 가져올 수 있도록 합니다.
