---
title: "Making changes"
source: "https://anthropic.skilljar.com/claude-code-in-action/303236"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## 변경 사항 만들기

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

개발 환경에서 Claude와 작업할 때는 기존 프로젝트에 변경을 가해야 하는 경우가 많습니다. 이 가이드는 스크린샷을 통한 시각적 커뮤니케이션과 Claude의 고급 추론 기능을 활용하는 것을 포함하여 변경 사항을 효과적으로 구현하기 위한 실용적인 기법을 다룹니다.

## 정확한 커뮤니케이션을 위해 스크린샷 사용

Claude와 커뮤니케이션하는 가장 효과적인 방법 중 하나는 스크린샷입니다. 인터페이스의 특정 부분을 수정하려면 스크린샷을 찍으면 Claude가 정확히 무엇을 언급하고 있는지 이해할 수 있습니다.

Claude에 스크린샷을 붙여넣으려면 `Ctrl+V`를 사용합니다(macOS에서는 `Cmd+V` 아님). 이 키보드 바로가기는 특히 채팅 인터페이스에 스크린샷을 붙여넣기 위해 설계되었습니다. 이미지를 붙여넣은 후 Claude에게 해당 영역에 특정 변경 사항을 만들도록 요청할 수 있습니다.

## Plan Mode(계획 모드)

코드베이스를 광범위하게 조사해야 하는 더 복잡한 작업의 경우 Plan Mode를 활성화할 수 있습니다. 이 기능을 사용하면 Claude는 변경 사항을 구현하기 전에 프로젝트를 철저히 탐색합니다.

`Shift + Tab`을 두 번 누르면 Plan Mode를 활성화합니다(이미 자동 수락 편집을 사용 중이라면 한 번). 이 모드에서 Claude는:

- 프로젝트에서 더 많은 파일을 읽습니다
- 자세한 구현 계획을 만듭니다
- 정확히 수행할 예정인 작업을 보여줍니다
- 진행하기 전에 승인을 기다립니다

이를 통해 계획을 검토하고 Claude가 중요한 내용을 놓쳤거나 특정 시나리오를 고려하지 않았다면 Claude를 리디렉션할 수 있습니다.

## Thinking Mode(생각 모드)

Claude는 "thinking(생각)" 모드를 통해 다양한 수준의 추론을 제공합니다. 이를 통해 Claude는 솔루션을 제공하기 전에 복잡한 문제를 해결하는 데 더 많은 시간을 소비할 수 있습니다.

사용 가능한 Thinking Mode는 다음과 같습니다:

- "Think" - 기본 추론
- "Think more" - 확장 추론
- "Think a lot" - 포괄적 추론
- "Think longer" - 확장 시간 추론
- "Ultrathink" - 최대 추론 능력

각 모드는 Claude에게 점진적으로 더 많은 토큰을 제공하여 어려운 문제를 더 깊이 있게 분석할 수 있습니다.

## Plan Mode vs Thinking Mode를 사용할 때

이 두 기능은 다양한 유형의 복잡성을 처리합니다:

**Plan Mode**가 가장 좋은 경우:

- 코드베이스를 광범위하게 이해해야 하는 작업
- 다단계 구현
- 여러 파일 또는 구성 요소에 영향을 미치는 변경 사항

**Thinking Mode**가 가장 좋은 경우:

- 복잡한 논리 문제
- 어려운 문제 디버깅
- 알고리즘 과제

두 모드를 결합하여 광범위함과 깊이가 모두 필요한 작업을 할 수 있습니다. 두 기능 모두 추가 토큰을 사용하므로, 사용하는 데에는 비용 고려 사항이 있습니다.
