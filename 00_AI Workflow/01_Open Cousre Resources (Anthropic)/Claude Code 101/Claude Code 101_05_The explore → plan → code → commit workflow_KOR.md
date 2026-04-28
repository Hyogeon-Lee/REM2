---
title: "explore → plan → code → commit 워크플로우"
source: "https://anthropic.skilljar.com/claude-code-101/469792"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

이 과정에서 단 하나만 얻어간다면 바로 이 워크플로우, **Explore, Plan, Code, and Commit**입니다. 이 워크플로우 없이는 대부분의 사람이 Claude에게 곧바로 코드 작성을 요청하게 되며, 결과적으로 나중에 더 많은 방향 수정(course-correcting)이 필요해집니다.

## Explore and Plan (탐색 및 계획)

처음 두 단계를 가장 빠르게 처리하는 방법은 **Plan Mode**를 사용하는 것입니다. Plan Mode에서 Claude는 파일을 편집할 수 없으며, 단지 구현을 어떻게 진행할지에 대한 정보를 수집하기 위해 파일을 읽기만 합니다.

Plan Mode로 진입하려면 텍스트 입력창 아래에 "Plan Mode"가 보일 때까지 `Shift + Tab`을 누르세요. 그런 다음 아래와 같은 프롬프트를 작성합니다:

![plan mode가 켜진 것을 보여주는 Claude Code 상태 표시줄, shift+tab으로 전환](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686390%2Fvideo5planmodeshifttab.1775686390450.jpg)

```js
I need to add WebP conversion to our image upload pipeline. Figure out where in the pipeline it should happen, whether we need new dependencies, and how to approach it.
```

Claude는 관련 파일을 읽고, 웹 검색을 몇 차례 수행한 후, 행동 계획(plan of action)을 제시합니다. 계획을 검토하고 자신의 기준에 부합하는지 판단하세요. 그렇지 않다면 특정 영역을 수정하도록 요청하세요.

![Claude Code가 특정 영역을 승인, 수정하거나 질문하는 옵션과 함께 계획을 표시합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686389%2Fvideo5planmodereviseareas.1775686389692.jpg)

코드가 한 줄도 작성되기 전이기 때문에, 이 시점이 방향을 수정하기에 가장 좋은 단계입니다. 이후 변경을 가할 의도 없이 단지 코드베이스의 일반적인 요약만 원한다면, Plan Mode가 아닌 상태에서 explore subagent를 실행할 수도 있습니다.

## Code (코드)

계획이 괜찮아 보이면 "approve"를 선택해 수락하고, Claude가 목록의 항목들을 차례로 수행하도록 두세요. Claude가 파일 편집을 자동으로 수락할지, 아니면 매번 물어볼지 선택할 수 있습니다.

Claude는 계획을 "완료"로 간주하기 전에 최선을 다해 문제를 해결하려 하겠지만, 때때로 사용자가 개입해야 할 때가 있습니다. 이것이 Plan Mode 작업의 이점입니다. 실행 후에는 결과에 도달하기까지의 컨텍스트가 함께 남아 있어, Claude의 다음 결정을 안내하는 데 도움이 됩니다.

코딩 단계를 더 원활하게 만드는 몇 가지 팁이 있습니다:

- **성공 기준을 정의하세요.** Claude가 결과에 확신을 가지려면 "올바른"이 무엇인지 명확해야 합니다. 계획을 작성할 때 이것을 명시적으로 하세요.
- **도구를 추가하세요.** Claude 완료 목표에 도움이 되는 도구는 많은 왕복을 제거합니다. 예를 들어, 웹 UI를 구축하는 경우 Claude in Chrome 확장을 설치하면 Claude Code가 브라우저 탭을 제어하고 UI를 직접 테스트할 수 있습니다.

![Chrome Web Store의 Claude in Chrome 확장 페이지](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686387%2Fvideo5claudeinchromeextension.1775686387012.jpg)

- **테스트 스위트를 포함하세요.** Claude가 지속적으로 검증할 수 있는 테스트 스위트를 제공하세요. Claude는 심지어 당신을 위해 테스트를 작성할 수도 있습니다. 이를 넘기기 전에 테스트가 거짓 긍정을 피하기 위한 신뢰할 수 있는 진실의 원천인지 확인하세요.

**빠른 팁:** Claude가 같은 문제에 계속 부딪히면 CLAUDE.md 파일에 솔루션을 저장하도록 요청하세요.

## Commit (커밋)

변경사항을 직접 테스트하고 결과에 만족하면 코드를 푸시할 시간입니다. 커밋하기 전에 **subagent code reviewer**를 실행하여 작업을 검토하도록 하세요. Subagent는 코드베이스에 새로운 관점을 제공합니다. 주 에이전트가 세션에서 가질 수 있는 편견을 가지지 않습니다.

![Claude Code에서 실행 중인 code-reviewer subagent, 파일을 읽고 최근 변경사항을 검토합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686388%2Fvideo5claudesubagentcodereviewer.1775686387773.jpg)

그 다음 Claude에게 당신의 스타일로 커밋 메시지를 생성하도록 하세요. 이를 반복하세요.

## 요약

Claude Code를 효과적으로 사용하려면 Explore, Plan, Code, and Commit 워크플로우를 따르세요:

- **Explore**는 Claude에게 프로젝트에 필요한 관련 컨텍스트를 제공합니다.
- **Plan**은 Claude가 성공을 측정하는 데 사용하는 행동 계획을 생성합니다.
- **Code**는 최종 결과에 정착하기 전에 당신과 Claude 사이의 왕복입니다.
- **Commit**은 코드를 검토하고 푸시하여 다음 기능을 시작할 수 있도록 도와줍니다.
