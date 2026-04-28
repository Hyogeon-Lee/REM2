---
title: "MCP 소개"
source: "https://anthropic.skilljar.com/introduction-to-model-context-protocol/296689"
author:
published:
created: 2026-04-28
description: "Claude를 통해 구축하는 방법을 배우고 Anthropic의 포괄적인 과정 및 교육 프로그램을 활용하세요."
tags:
  - "clippings"
---
## 헤더 내비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [코스](https://anthropic.skilljar.com/) 

  [상세](#)## MCP 소개

 

이 영상은 여전히 처리 중입니다. 나중에 다시 확인하고 페이지를 새로 고쳐주세요.

요약

#### 요약

Model Context Protocol (MCP, 모델 컨텍스트 프로토콜)는 번거로운 통합 코드를 잔뜩 작성할 필요 없이 Claude에게 컨텍스트와 도구를 제공하는 통신 계층입니다. 도구 정의 및 실행의 부담을 여러분의 서버에서 전문화된 MCP server로 옮기는 방식이라고 생각하면 됩니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849216%2F09_-_001_-_Introducing_MCP_01.1749849216723.png)

MCP를 처음 접하면 기본 아키텍처를 보여주는 다이어그램을 보게 됩니다. MCP client(클라이언트, 여러분의 서버)가 도구, 프롬프트, 리소스를 포함하는 MCP server들에 연결되는 구조입니다. 각 MCP server는 외부 서비스에 대한 인터페이스 역할을 합니다.

## MCP가 해결하는 문제

사용자가 자신의 GitHub 데이터에 대해 Claude에게 질문할 수 있는 채팅 인터페이스를 구축한다고 가정해 봅시다. 사용자가 "내 모든 리포지토리에 걸쳐 열려 있는 pull request는 어떤 것이 있나요?"라고 물어볼 수 있습니다. 이를 처리하려면 Claude가 GitHub API에 접근할 수 있는 도구가 필요합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849217%2F09_-_001_-_Introducing_MCP_03.1749849217761.png)

GitHub는 리포지토리, pull request, 이슈, 프로젝트 등 방대한 양의 기능을 가지고 있습니다. MCP 없이는 GitHub의 모든 기능을 처리하기 위해 엄청난 수의 도구 스키마와 함수를 만들어야 합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849218%2F09_-_001_-_Introducing_MCP_05.1749849218279.png)

이는 모든 통합 코드를 직접 작성, 테스트, 유지 관리해야 함을 의미합니다. 이는 많은 노력과 지속적인 유지 관리 부담입니다.

## MCP의 작동 원리

MCP는 도구 정의 및 실행을 여러분의 서버에서 전용 MCP server로 이전하여 이러한 부담을 덜어 줍니다. 모든 GitHub 도구를 직접 작성하는 대신, GitHub용 MCP server가 이를 처리해 줍니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849219%2F09_-_001_-_Introducing_MCP_08.1749849219623.png)

MCP server는 GitHub 관련 방대한 기능을 래핑(wrapping)하여 표준화된 도구 집합으로 노출합니다. 여러분의 애플리케이션은 모든 것을 처음부터 구현하는 대신 이 MCP server에 연결합니다.

## MCP server에 대한 설명

MCP server는 외부 서비스가 구현한 데이터나 기능에 대한 접근을 제공합니다. 도구, 프롬프트, 리소스를 표준화된 방식으로 노출하는 전용 인터페이스로 동작합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1749849221%2F09_-_001_-_Introducing_MCP_10.1749849221341.png)

GitHub 예제에서, GitHub용 MCP server는 `get_repos()`와 같은 도구를 포함하고 GitHub API에 직접 연결합니다. 여러분의 서버는 MCP server와 통신하며, MCP server가 GitHub 관련 모든 구현 세부 사항을 처리합니다.

## 자주 묻는 질문

### MCP server는 누가 작성하나요?

누구나 MCP server를 구현할 수 있습니다. 서비스 제공자가 직접 자사의 공식 MCP 구현을 만드는 경우도 많습니다. 예를 들어 AWS가 다양한 서비스용 도구를 갖춘 공식 MCP server를 출시할 수 있습니다.

### 이것이 API를 직접 호출하는 것과 어떻게 다른가요?

MCP server는 이미 정의된 도구 스키마와 함수를 제공합니다. API를 직접 호출하려면 그러한 도구 정의를 직접 작성해야 합니다. MCP는 이러한 구현 작업을 줄여 줍니다.

### MCP가 단순히 도구 사용과 같은 것 아닌가요?

흔한 오해입니다. MCP server와 도구 사용(tool use)은 상호 보완적이지만 서로 다른 개념입니다. MCP server는 이미 정의된 도구 스키마와 함수를 제공하는 반면, tool use는 Claude가 실제로 그 도구들을 호출하는 방식을 다룹니다. 핵심 차이는 "누가 그 작업을 하는가"입니다. MCP를 사용하면 누군가가 이미 그 도구들을 구현해 둔 상태입니다.

이점은 분명합니다. 복잡한 통합 코드를 직접 유지 관리하는 대신, 외부 서비스에 연결하는 무거운 작업을 대신 처리해 주는 MCP server를 활용할 수 있습니다.
