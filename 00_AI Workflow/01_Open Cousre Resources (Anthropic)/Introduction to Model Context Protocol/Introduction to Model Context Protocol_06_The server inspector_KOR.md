---
title: "Server Inspector(서버 인스펙터)"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296693"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## Server Inspector(서버 인스펙터)

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

MCP server를 구축할 때, 전체 애플리케이션에 연결하지 않고도 기능을 테스트할 수 있는 방법이 필요합니다. Python MCP SDK에는 server를 실시간으로 디버깅하고 테스트할 수 있는 브라우저 기반 inspector(인스펙터)가 내장되어 있습니다.

## Inspector 실행하기

먼저 Python 환경이 활성화되어 있는지 확인하세요(정확한 명령어는 프로젝트의 README를 참고하세요). 그런 다음 다음 명령으로 inspector를 실행합니다.

```js
mcp dev mcp_server.py
```

이 명령은 개발용 server를 시작하고, 일반적으로 `http://127.0.0.1:6274` 같은 형태의 로컬 URL을 제공합니다. 브라우저에서 이 URL을 열어 MCP Inspector에 접속하세요.

## Inspector 인터페이스 사용하기

Inspector 인터페이스는 현재도 활발하게 개발이 진행되고 있으므로, 여러분이 사용할 때는 모습이 약간 다를 수 있습니다. 다만 핵심 기능은 일관적으로 유지됩니다. 다음의 주요 요소들을 찾아보세요.

- MCP server를 기동(start)하는 **Connect** 버튼
- **Resources(리소스)**, **Tools(도구)**, **Prompts(프롬프트)** 등 다양한 기능을 위한 내비게이션 탭
- 도구 목록 및 테스트 패널

먼저 Connect 버튼을 클릭해 server를 초기화합니다. 연결 상태가 "Disconnected"에서 "Connected"로 바뀌는 것을 확인할 수 있습니다.

## 도구 테스트하기

Tools 섹션으로 이동한 뒤 "List Tools"를 클릭하면 server에서 사용할 수 있는 모든 도구가 표시됩니다. 특정 도구를 선택하면 오른쪽 패널에 해당 도구의 세부 정보와 입력 필드가 나타납니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849212%2F09_-_005_-_The_Server_Inspector_10.1749849212534.png)

예를 들어 문서 읽기 도구를 테스트하려면 다음과 같이 진행합니다.

1. `read_doc_contents` 도구를 선택합니다.
2. 문서 ID(예: "deposition.md")를 입력합니다.
3. "Run Tool"을 클릭합니다.
4. 성공 여부와 예상한 출력 결과가 나오는지 확인합니다.

Inspector는 성공 상태와 실제 반환된 데이터를 모두 보여 주므로, 도구가 올바르게 동작하는지 쉽게 확인할 수 있습니다.

## 도구 간 상호작용 테스트

여러 도구를 순차적으로 호출하여 복잡한 워크플로우를 검증할 수 있습니다. 예를 들어, 편집(edit) 도구로 문서를 수정한 직후 읽기(read) 도구를 호출하여 변경 사항이 정상적으로 반영되었는지 확인할 수 있습니다.

Inspector는 도구 호출 사이에 server의 상태(state)를 유지하므로, 편집 결과가 누적되어 MCP server의 전체 기능을 검증할 수 있습니다.

## 개발 워크플로우

MCP Inspector는 개발 과정에서 필수적인 도구가 됩니다. 별도의 테스트 스크립트를 작성하거나 전체 애플리케이션에 연결하지 않고도 다음과 같은 작업을 할 수 있습니다.

- 도구 구현을 빠르게 반복(iterate)
- 엣지 케이스(edge case)와 오류 조건 테스트
- 도구 상호작용 및 상태 관리 검증
- 실시간 문제 디버깅

이러한 즉각적인 피드백 루프는 MCP server 개발을 훨씬 효율적으로 만들고, 개발 초기 단계에 문제를 발견할 수 있도록 도와줍니다.
