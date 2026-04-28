---
title: "What is a coding assistant?"
source: "https://anthropic.skilljar.com/claude-code-in-action/303235"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## 코딩 어시스턴트란 무엇인가?

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

코딩 어시스턴트는 단순히 코드를 작성하는 도구 이상입니다. 언어 모델을 사용하여 복잡한 프로그래밍 작업을 해결하는 정교한 시스템입니다. 이러한 어시스턴트가 어떻게 작동하는지 이해하면 진정으로 강력한 코딩 파트너가 무엇인지 이해할 수 있습니다.

## 코딩 어시스턴트의 작동 방식

코딩 어시스턴트에게 버그를 고치는 것과 같은 작업을 주면, 인간 개발자가 문제에 접근하는 방식과 유사한 프로세스를 따릅니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1750967940%2F002_-_What_is_a_Coding_Assistant%3F_02.1750967940100.png)

1. **컨텍스트 수집** - 오류가 무엇을 의미하는지, 코드베이스의 어느 부분이 영향을 받는지, 어떤 파일이 관련되어 있는지 이해하기
2. **계획 수립** - 코드 변경과 테스트 실행으로 수정을 검증하는 등 문제 해결 방법 결정
3. **작업 수행** - 파일 업데이트 및 명령 실행으로 솔루션 실제 구현

여기서 핵심은 첫 번째와 마지막 단계가 외부 세계와의 상호 작용이 필요하다는 것입니다. 파일 읽기, 문서 조회, 명령 실행 또는 코드 편집이 필요합니다.

## Tool Use(도구 사용)의 과제

흥미로운 부분이 여기서 나옵니다. 언어 모델 자체는 텍스트를 처리하고 텍스트를 반환할 수만 있습니다. 파일을 읽거나 명령을 실행할 수 없습니다. 독립 실행형 언어 모델에게 파일을 읽도록 요청하면, 그 기능이 없다고 말할 것입니다.

그렇다면 코딩 어시스턴트는 이 문제를 어떻게 해결할까요? "tool use"라는 영리한 시스템을 사용합니다.

## Tool Use의 작동 방식

코딩 어시스턴트에 요청을 보내면, 언어 모델에게 작업을 요청하는 방법을 알려주는 지침이 메시지에 자동으로 추가됩니다. 예를 들어 "파일을 읽고 싶으면 'ReadFile: 파일명'이라고 응답하세요"라는 텍스트를 추가할 수 있습니다.

완전한 흐름은 다음과 같습니다:

1. 당신: "main.go 파일에 작성된 코드는 무엇인가요?"
2. 코딩 어시스턴트: tool 지침을 요청에 추가
3. 언어 모델: "ReadFile: main.go"로 응답
4. 코딩 어시스턴트: 실제 파일을 읽고 내용을 모델로 전송
5. 언어 모델: 파일 내용을 기반으로 최종 답변 제공

이 시스템을 통해 언어 모델은 실제로는 신중하게 형식화된 텍스트 응답을 생성하고 있지만 효과적으로 "파일을 읽고", "코드를 작성하고", "명령을 실행할" 수 있습니다.

## Claude의 Tool Use가 중요한 이유

모든 언어 모델이 도구를 사용하는 데 똑같이 능숙하지는 않습니다. Claude 시리즈 모델(Opus, Sonnet, Haiku)은 도구가 무엇인지 이해하고 복잡한 작업을 완료하기 위해 도구를 효과적으로 사용하는 데 특히 강합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1750967942%2F002_-_What_is_a_Coding_Assistant%3F_14.1750967942536.png)

Tool use의 이러한 강점은 Claude Code에 여러 핵심 이점을 제공합니다:

## 강력한 Tool Use의 이점

- **더 어려운 작업 수행** - Claude는 다양한 도구를 결합하여 복잡한 작업을 처리할 수 있으며, 이전에 본 적 없는 도구도 사용합니다
- **확장 가능한 플랫폼** - Claude Code에 새로운 도구를 쉽게 추가할 수 있으며, Claude는 워크플로가 진화함에 따라 도구를 적응하여 사용합니다
- **더 나은 보안** - Claude Code는 색인화 없이 코드베이스를 탐색할 수 있습니다. 이는 종종 전체 코드베이스를 외부 서버에 보내지 않아도 된다는 의미입니다

## 핵심 요점

코딩 어시스턴트를 이해하는 것은 몇 가지 핵심 사항으로 귀결됩니다:

- 코딩 어시스턴트는 언어 모델을 사용하여 다양한 작업을 완료합니다
- 언어 모델은 대부분의 실제 프로그래밍 작업을 처리하기 위해 도구가 필요합니다
- 모든 언어 모델이 동일한 기술 수준으로 도구를 사용하지는 않습니다
- Claude의 강력한 tool use는 Claude Code에서 더 나은 보안, 사용자 정의 및 수명을 가능하게 합니다

이 tool use 능력은 단순한 텍스트 생성 모델을 파일을 읽고, 코드베이스를 이해하며, 프로젝트에 의미 있는 변경을 할 수 있는 강력한 코딩 어시스턴트로 변환합니다.
