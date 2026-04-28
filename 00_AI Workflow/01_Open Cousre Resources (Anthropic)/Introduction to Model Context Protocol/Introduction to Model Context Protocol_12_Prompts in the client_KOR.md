---
title: "클라이언트의 프롬프트"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296692"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## 클라이언트의 프롬프트

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

MCP 클라이언트를 구축하는 마지막 단계는 프롬프트 기능 구현입니다. 이것은 서버에서 모든 사용 가능한 프롬프트를 나열하고 변수가 채워진 특정 프롬프트를 검색할 수 있게 합니다.

## 프롬프트 나열 구현

`list_prompts` 메서드는 간단합니다. 세션의 프롬프트 나열 함수를 호출하고 프롬프트를 반환합니다:

```js
async def list_prompts(self) -> list[types.Prompt]:
    result = await self.session().list_prompts()
    return result.prompts
```

## 개별 프롬프트 가져오기

`get_prompt` 메서드는 변수 보간을 처리하기 때문에 더 흥미롭습니다. 프롬프트를 요청할 때 프롬프트 함수에 키워드 인수로 전달되는 인수를 제공합니다:

```js
async def get_prompt(self, prompt_name, args: dict[str, str]):
    result = await self.session().get_prompt(prompt_name, args)
    return result.messages
```

예를 들어 서버가 `doc_id` 매개변수를 예상하는 `format_document` 프롬프트를 가지고 있다면, 인수 딕셔너리는 `{"doc_id": "plan.md"}`를 포함합니다. 이 값은 프롬프트 템플릿에 보간됩니다.

## 실제 프롬프트 테스트

구현 후, CLI를 통해 프롬프트를 테스트할 수 있습니다. 슬래시 (`/`)를 입력하면 사용 가능한 프롬프트가 명령으로 나타납니다. "format" 같은 프롬프트를 선택하면 사용 가능한 문서 중에서 선택하라는 메시지가 표시됩니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1751999840%2F011_-_Prompts_in_the_Client_11.1751999840520.png)

문서를 선택한 후, 시스템은 완전한 프롬프트를 Claude에 보냅니다. AI는 포맷팅 지침과 문서 ID를 모두 받은 다음 사용 가능한 도구를 사용하여 콘텐츠를 가져와 처리합니다.

## 프롬프트 작동 방식

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1751999841%2F011_-_Prompts_in_the_Client_17.1751999841663.png)

프롬프트는 클라이언트가 사용할 수 있는 사용자 및 어시스턴트 메시지 세트를 정의합니다. 고품질이고, 잘 테스트되고, MCP 서버의 목적과 관련이 있어야 합니다. 워크플로우는:

- MCP 서버의 기능과 관련된 프롬프트 작성 및 평가
- `@mcp.prompt` 데코레이터를 사용하여 MCP 서버에서 프롬프트 정의
- 클라이언트는 언제든지 프롬프트 요청 가능
- 클라이언트가 제공한 인수는 프롬프트 함수의 키워드 인수가 됨
- 함수는 AI 모델에 준비된 포맷된 메시지 반환

이 시스템은 변수를 통한 커스터마이제이션을 허용하면서 일관성을 유지하는 재사용 가능하고 매개변수화된 프롬프트를 만듭니다. AI가 매번 올바르게 구조화된 지침을 받도록 하려는 복잡한 워크플로우에서 특히 유용합니다.
