---
title: "리소스 접근"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296695"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## 리소스 접근

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

MCP의 리소스를 통해 서버는 도구 호출이 필요하지 않은 데이터를 프롬프트에 직접 포함할 수 있습니다. 이는 AI 모델에 컨텍스트를 제공하는 보다 효율적인 방법을 만듭니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849281%2F09_-_008_-_Accessing_Resources_00.1749849281584.png)

위의 다이어그램은 리소스가 어떻게 작동하는지 보여줍니다: 사용자가 "@..."처럼 무언가를 입력하면 코드가 이를 리소스 요청으로 인식하고, ReadResourceRequest를 MCP 서버로 보내고, 실제 내용이 있는 ReadResourceResult를 받습니다.

## 리소스 읽기 구현

MCP 클라이언트에서 리소스 접근을 활성화하려면 `read_resource` 함수를 구현해야 합니다. 먼저 필요한 임포트를 추가합니다:

```js
import json
from pydantic import AnyUrl
```

핵심 함수는 MCP 서버에 요청하고 MIME 타입에 따라 응답을 처리합니다:

```js
async def read_resource(self, uri: str) -> Any:
    result = await self.session().read_resource(AnyUrl(uri))
    resource = result.contents[0]
    
    if isinstance(resource, types.TextResourceContents):
        if resource.mimeType == "application/json":
            return json.loads(resource.text)
    
    return resource.text
```

## 응답 구조 이해

리소스를 요청하면 서버는 `contents` 목록이 있는 결과를 반환합니다. 일반적으로 한 번에 하나의 리소스만 필요하므로 첫 번째 요소에 접근합니다. 응답에는 다음이 포함됩니다:

- 실제 콘텐츠 (텍스트 또는 데이터)
- 콘텐츠를 구문 분석하는 방법을 알려주는 MIME 타입
- 리소스에 대한 기타 메타데이터

## 콘텐츠 타입 처리

함수는 MIME 타입을 확인하여 콘텐츠를 처리하는 방법을 결정합니다:

- `application/json`이면 텍스트를 JSON으로 파싱하고 파싱된 객체 반환
- 그 외는 원본 텍스트 내용 반환

이 접근법은 구조화된 데이터 (JSON 같은)와 일반 텍스트 문서를 매끄럽게 처리합니다.

## 리소스 접근 테스트

구현 후, CLI 애플리케이션을 통해 리소스 기능을 테스트할 수 있습니다. 리소스 이름 앞에 "@"을 입력하면 시스템은:

1. 자동 완성 목록에 사용 가능한 리소스 표시
2. 화살표 키와 스페이스로 리소스 선택 가능
3. 리소스 내용을 프롬프트에 직접 포함
4. 추가 도구 호출 없이 AI 모델로 모든 것 전송

이것은 AI 모델이 문서 내용에 접근하기 위해 별도의 도구 호출을 해야 하는 것보다 훨씬 부드러운 사용자 경험을 만듭니다. 리소스 내용이 초기 컨텍스트의 일부가 되어 데이터에 대한 즉각적인 응답을 가능하게 합니다.
