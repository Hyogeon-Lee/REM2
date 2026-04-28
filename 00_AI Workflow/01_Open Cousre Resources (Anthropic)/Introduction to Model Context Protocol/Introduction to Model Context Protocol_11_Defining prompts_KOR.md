---
title: "프롬프트 정의"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296698"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## 프롬프트 정의

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

MCP 서버의 프롬프트를 통해 클라이언트가 자체 프롬프트를 작성하는 대신 사용할 수 있는 미리 구축된 고품질 지침을 정의할 수 있습니다. 사용자가 직접 작성할 것보다 더 나은 결과를 제공하는 신중하게 작성된 템플릿으로 생각하면 됩니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849287%2F09_-_009_-_Defining_Prompts_00.1749849286857.png)

## 프롬프트를 사용하는 이유?

핵심 통찰력은 다음과 같습니다: 사용자는 이미 대부분의 작업을 Claude에 직접 수행하도록 요청할 수 있습니다. 예를 들어 사용자가 "report.pdf를 마크다운으로 재포맷팅해"라고 입력하면 적절한 결과를 얻을 수 있습니다. 하지만 엣지 케이스를 처리하고 모범 사례를 따르는 철저하게 테스트된 전문화된 프롬프트를 제공하면 훨씬 더 나은 결과를 얻을 것입니다.

MCP 서버 작성자로서, 다양한 시나리오에서 일관되게 작동하는 프롬프트를 작성, 테스트 및 평가하는 데 시간을 투자할 수 있습니다. 사용자는 프롬프트 엔지니어링 전문가가 될 필요 없이 이 전문 지식의 혜택을 받습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849289%2F09_-_009_-_Defining_Prompts_07.1749849288094.png)

## 포맷 명령 구축

실제 예제를 구현해봅시다: 문서를 마크다운으로 변환하는 포맷 명령. 사용자가 `/format doc_id`를 입력하면 문서의 전문적으로 포맷된 마크다운 버전을 받습니다.

워크플로우는 다음과 같습니다:

- 사용자가 `/`를 입력하여 사용 가능한 명령 확인
- 사용자가 `format`을 선택하고 문서 ID 지정
- Claude가 미리 구축된 프롬프트를 사용하여 문서를 읽고 재포맷
- 적절한 헤더, 목록 및 포맷이 있는 깔끔한 마크다운 결과

## 프롬프트 정의

프롬프트는 도구 및 리소스와 유사한 데코레이터 패턴을 사용합니다:

```js
@mcp.prompt(
    name="format",
    description="Rewrites the contents of the document in Markdown format."
)
def format_document(
    doc_id: str = Field(description="Id of the document to format")
) -> list[base.Message]:
    prompt = f"""
Your goal is to reformat a document to be written with markdown syntax.

The id of the document you need to reformat is:
<document_id>
{doc_id}
</document_id>

Add in headers, bullet points, tables, etc as necessary. Feel free to add in structure.
Use the 'edit_document' tool to edit the document. After the document has been reformatted...
"""
    
    return [
        base.UserMessage(prompt)
    ]
```

함수는 Claude에 직접 전송되는 메시지 목록을 반환합니다. 더 복잡한 대화 흐름을 만들기 위해 여러 사용자 및 어시스턴트 메시지를 포함할 수 있습니다.

## 프롬프트 테스트

배포 전에 MCP Inspector를 사용하여 프롬프트를 테스트하세요:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849289%2F09_-_009_-_Defining_Prompts_18.1749849289799.png)

검사기는 Claude에 전송될 정확한 메시지를 표시하며, 변수가 프롬프트 템플릿에 어떻게 보간되는지 포함합니다. 이를 통해 사용자가 프롬프트에 의존하기 전에 프롬프트가 올바른지 확인할 수 있습니다.

## 주요 이점

- **일관성** - 사용자는 매번 안정적인 결과를 얻음
- **전문 지식** - 프롬프트에 도메인 지식을 인코딩할 수 있음
- **재사용성** - 여러 클라이언트 애플리케이션이 동일한 프롬프트 사용 가능
- **유지 관리** - 한 곳에서 프롬프트를 업데이트하여 모든 클라이언트 개선

프롬프트는 MCP 서버의 도메인에 특화될 때 가장 잘 작동합니다. 문서 관리 서버는 포맷팅, 요약 또는 문서 분석을 위한 프롬프트를 가질 수 있습니다. 데이터 분석 서버는 보고서 생성 또는 시각화를 위한 프롬프트를 가질 수 있습니다.

목표는 사용자가 자신의 지침을 직접 작성하는 것보다 선호할 정도로 잘 작성되고 테스트된 프롬프트를 제공하는 것입니다.
