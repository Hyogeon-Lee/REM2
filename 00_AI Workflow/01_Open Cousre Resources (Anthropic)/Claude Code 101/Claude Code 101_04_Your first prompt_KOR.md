---
title: "첫 번째 프롬프트"
source: "https://anthropic.skilljar.com/claude-code-101/469791"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Claude Code와의 대화는 다른 AI 어시스턴트와 동일한 방식으로 이루어집니다. 프롬프트를 입력할 때, 자신을 보호하고 작업을 더 수월하게 만들 수 있는 몇 가지 사항을 고려해 보세요.

## Auto-Accept vs. Approval (자동 수락 vs. 승인)

Claude가 제안하는 모든 파일 변경을 자동으로 수락할지, 아니면 매번 명시적인 권한을 요청할지 선택할 수 있습니다. `Shift + Tab`을 눌러 모드를 전환하세요.

- **Approval mode (승인 모드):** Claude가 파일을 편집하거나 명령을 실행할 때마다 권한을 요청합니다.
- **Auto-accept mode (자동 수락 모드):** 파일 편집은 자동으로 승인되지만, 명령은 여전히 권한이 필요합니다.

정답은 없습니다. 자신에게 편한 방식을 선택하세요.

![auto-accept 모드인 Claude Code, 파일을 읽고 작업을 진행하는 모습](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686381%2Fvideo4autoaccept.1775686381332.jpg)

## Plan Mode

`Shift + Tab` 메뉴 안에는 **Plan Mode**가 있습니다. Plan Mode는 프롬프트를 받아 읽기 전용 도구를 사용해 코드베이스를 분석하고, 제안된 구현 방식을 조사합니다. 진행 도중 명확화를 위한 질문(clarifying questions)을 던지고, 실행 가능한 상세 계획을 반환합니다.

Plan Mode는 복잡한 변경을 계획하거나 안전한 코드 리뷰를 수행하는 데 매우 유용합니다. 많은 경우 Claude에 기능에 대한 다단계 구현을 맡기게 되는데, 이것이 바로 Plan Mode가 진가를 발휘하는 영역입니다.

![plan mode가 켜진 Claude Code, 상태 표시줄 표시기를 보여줌](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686384%2Fvideo4planmode.1775686383837.jpg)

## 예제: Dark Mode Toggle 추가

예제를 하나 살펴보겠습니다. 애플리케이션에 dark mode toggle이 필요하다고 가정해 봅시다. 프로젝트의 루트 디렉토리를 열고 `claude`를 실행하세요. `Shift + Tab`을 몇 번 눌러 Plan Mode로 진입한 후, 다음과 같은 프롬프트를 작성하세요:

```js
My app needs a dark mode implemented across the entire app. Can you create a toggle switch on the header that allows a user to toggle between light mode and dark mode? I need you to find a good contrast color that works based on my existing light theme.
```

![plan mode가 활성화된 Claude Code에서 dark mode 프롬프트 입력](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686383%2Fvideo4demoenteringpromptinplanmode.1775686382790.jpg)

Claude가 계획을 세우도록 두세요. 계획을 검토하고 괜찮아 보이면 승인한 뒤, Claude가 각 단계마다 승인을 요청하도록 하세요. 마지막에는 Claude가 무엇을 했고 어떻게 결론에 도달했는지 정확히 확인할 수 있습니다.

## 요약

Claude Code를 사용할 때는 프롬프트를 가능한 한 구체적이고 자세하게 작성하세요. 모든 단계에서 함께 따라가고 싶다면 그렇게 할 수 있습니다. Plan Mode를 활용해 Claude가 코드를 실행하기 전에 달성하려는 목표의 세부사항을 충분히 파악하도록 하세요.
