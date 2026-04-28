---
title: "MCP로 도구 정의하기"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296697"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## MCP로 도구 정의하기

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

공식 Python SDK를 사용하면 MCP server 구축이 훨씬 간단해집니다. 복잡한 JSON 스키마를 손으로 작성하는 대신, decorator(데코레이터)로 도구를 정의하고 SDK가 무거운 작업을 처리하도록 맡기면 됩니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849221%2F09_-_004_-_Defining_Tools_with_MCP_00.1749849221750.png)

이 예제에서는 두 가지 핵심 도구를 갖춘 문서 관리 server를 만듭니다. 하나는 문서를 읽는 도구, 다른 하나는 문서를 업데이트하는 도구입니다. 모든 문서는 단순 딕셔너리(dictionary) 형태로 메모리에 존재하며, 키(key)는 문서 ID, 값(value)은 문서 내용입니다.

## MCP server 설정

Python MCP SDK는 server 생성을 매우 간단하게 만들어 줍니다. 단 한 줄로 server를 초기화할 수 있습니다.

```js
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("DocumentMCP", log_level="ERROR")
```

문서는 다음과 같이 단순 딕셔너리 구조로 저장할 수 있습니다.

```js
docs = {
    "deposition.md": "This deposition covers the testimony of Angela Smith, P.E.",
    "report.pdf": "The report details the state of a 20m condenser tower.",
    "financials.docx": "These financials outline the project's budget and expenditures",
    "outlook.pdf": "This document presents the projected future performance of the system",
    "plan.md": "The plan outlines the steps for the project's implementation.",
    "spec.txt": "These specifications define the technical requirements for the equipment"
}
```

## decorator로 도구 정의하기

SDK는 decorator를 사용해 도구를 정의합니다. JSON 스키마를 직접 손으로 작성하는 대신, Python의 타입 힌트(type hint)와 필드 설명(field description)을 활용할 수 있습니다. SDK는 Claude가 이해할 수 있는 적절한 스키마를 자동으로 생성해 줍니다.

## 문서 읽기 도구(Document Reader Tool) 만들기

첫 번째 도구는 ID를 통해 문서 내용을 읽어옵니다. 전체 구현은 다음과 같습니다.

```js
@mcp.tool(
    name="read_doc_contents",
    description="Read the contents of a document and return it as a string."
)
def read_document(
    doc_id: str = Field(description="Id of the document to read")
):
    if doc_id not in docs:
        raise ValueError(f"Doc with id {doc_id} not found")
    
    return docs[doc_id]
```

decorator는 도구의 이름(name)과 설명(description)을 지정하고, 함수 매개변수(parameter)는 필수 인수(argument)를 정의합니다. Pydantic의 `Field` 클래스는 인수에 대한 설명을 제공하여, Claude가 각 매개변수가 어떤 값을 받는지 이해하는 데 도움을 줍니다.

## 문서 편집 도구(Document Editor Tool) 만들기

두 번째 도구는 문서에 대해 간단한 찾기/바꾸기(find-and-replace) 연산을 수행합니다.

```js
@mcp.tool(
    name="edit_document",
    description="Edit a document by replacing a string in the documents content with a new string."
)
def edit_document(
    doc_id: str = Field(description="Id of the document that will be edited"),
    old_str: str = Field(description="The text to replace. Must match exactly, including whitespace."),
    new_str: str = Field(description="The new text to insert in place of the old text.")
):
    if doc_id not in docs:
        raise ValueError(f"Doc with id {doc_id} not found")
    
    docs[doc_id] = docs[doc_id].replace(old_str, new_str)
```

이 도구는 세 개의 매개변수를 받습니다. 문서 ID, 찾을 텍스트, 그리고 대체할 텍스트입니다. 구현체에는 존재하지 않는 문서에 대한 오류 처리가 포함되어 있으며, 간단한 문자열 치환을 수행합니다.

## SDK 방식의 주요 이점

- JSON 스키마를 수동으로 작성할 필요가 없음
- 타입 힌트가 자동 검증을 제공
- 명확한 매개변수 설명이 Claude의 도구 사용 이해를 도움
- 오류 처리가 Python 예외(exception)와 자연스럽게 통합됨
- decorator를 통해 도구 등록이 자동으로 이루어짐

MCP Python SDK는 도구 생성을 복잡한 스키마 작성 작업에서 단순한 Python 함수 정의로 바꿔 줍니다. 이 방식은 Claude가 올바른 형식의 도구 사양(specification)을 받도록 보장하면서, MCP server를 훨씬 쉽게 구축하고 유지 관리할 수 있게 해 줍니다.
