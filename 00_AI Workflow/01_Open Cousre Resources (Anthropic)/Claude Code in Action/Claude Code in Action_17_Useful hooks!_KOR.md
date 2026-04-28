---
title: "Useful hooks!"
source: "https://anthropic.skilljar.com/claude-code-in-action/312004"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## 유용한 Hook(훅)들!

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Claude Code Hook은 AI 지원 개발의 일반적인 약점을 해결할 수 있습니다. 특히 더 큰 프로젝트에서 효과적입니다. 이러한 Hook은 Claude가 코드에 변경을 가할 때마다 자동으로 실행되어 즉각적인 피드백을 제공하고 일반적인 문제를 방지합니다.

## TypeScript 타입 검사 Hook

가장 유용한 Hook 중 하나는 근본적인 문제를 해결합니다: Claude가 함수 시그니처(signature)를 수정할 때, 프로젝트 전체에서 해당 함수가 호출되는 모든 위치를 업데이트하지 못하는 경우가 많습니다.

예를 들어 Claude에게 `schema.ts`의 함수에 `verbose` 매개변수를 추가하도록 요청하면 함수 정의를 성공적으로 업데이트하지만 `main.ts`의 호출 사이트를 놓칩니다. 이는 Claude가 즉시 포착하지 못하는 타입 오류를 생성합니다.

해결책은 모든 파일 편집 후 TypeScript 컴파일러를 실행하는 사후 도구 사용 Hook입니다:

- 타입 오류가 있는지 확인하려면 `tsc --noEmit`을 실행합니다
- 발견된 모든 오류를 캡처합니다
- 오류를 Claude에 즉시 다시 피드합니다
- Claude에 다른 파일의 문제를 수정하도록 요청합니다

이 Hook은 타입 검사기를 실행할 수 있는 모든 타입 지정 언어에서 작동합니다. 타입이 없는 언어의 경우 자동화된 테스트를 대신 사용하여 유사한 기능을 구현할 수 있습니다.

## 쿼리 중복 방지 Hook

많은 데이터베이스 쿼리가 있는 더 큰 프로젝트에서 Claude는 기존 코드를 재사용하는 대신 중복 기능을 만드는 경우가 있습니다. 이는 특히 Claude에게 데이터베이스 작업이 단지 한 가지 구성 요소인 복잡한 다단계 작업을 제공할 때 문제가 됩니다.

여러 쿼리 파일이 있는 프로젝트 구조를 고려하세요. 각각 많은 SQL 함수를 포함합니다. Claude에게 "3일 이상 대기 중인 주문에 대해 알리는 Slack 통합을 생성하세요"라고 요청하면 기존 `getPendingOrders()` 함수를 사용하는 대신 새로운 쿼리를 작성할 수 있습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618172%2F013_-_Useful_Hooks%21_09.1752618172075.png)

쿼리 중복 Hook은 검토 프로세스를 구현하여 이를 해결합니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618172%2F013_-_Useful_Hooks%21_14.1752618172611.png)

작동 방식:

- `./queries` 디렉토리의 파일을 Claude가 수정할 때 트리거합니다
- 프로그래밍 방식으로 Claude Code의 별도 인스턴스를 시작합니다
- 두 번째 인스턴스에 변경 사항을 검토하고 유사한 기존 쿼리를 확인하도록 요청합니다
- 중복이 발견되면 원본 Claude 인스턴스에 피드백을 제공합니다
- Claude에 중복을 제거하고 기존 기능을 사용하도록 요청합니다

## 구현 고려사항

두 Hook은 사전 도구 사용 또는 사후 도구 사용 Hook 시스템을 사용합니다. TypeScript Hook은 상대적으로 가볍고 빠르게 실행됩니다. 쿼리 중복 Hook은 각 검토에 대해 별도의 Claude 인스턴스를 시작하므로 더 많은 리소스가 필요합니다.

쿼리 Hook의 경우 이러한 트레이드오프를 고려합니다:

- **이점:** 중복이 적은 깔끔한 코드베이스
- **비용:** 각 쿼리 디렉토리 편집에 대한 추가 시간 및 API 사용
- **권장:** 오버헤드를 최소화하려면 중요한 디렉토리만 모니터링합니다

Hook은 Claude의 TypeScript SDK를 사용하여 프로그래밍 방식으로 AI와 상호 작용합니다. 이를 통해 한 Claude 인스턴스가 다른 인스턴스의 작업을 검토하고 피드백을 제공하는 정교한 워크플로를 생성할 수 있습니다.

## 이러한 개념 확장

이러한 Hook은 자신의 프로젝트에 적용할 수 있는 더 광범위한 원칙을 보여줍니다:

- 컴파일러/린터 출력을 사용하여 즉각적인 피드백 제공
- 별도의 AI 인스턴스를 사용하여 코드 검토 프로세스 구현
- 일관성이 중요한 고가치 디렉토리에 모니터링 초점
- 자동화 이점을 성능 비용과 균형 맞추기

핵심은 개발 워크플로의 특정 문제점(pain point)을 식별하고 이러한 문제를 자동으로 해결하는 맞춤형 Hook을 만드는 것입니다.
