---
title: "컨텍스트 관리"
source: "https://anthropic.skilljar.com/claude-code-101/469793"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

컨텍스트는 Claude의 작업 메모리입니다. 읽은 모든 파일, 실행한 모든 명령, 보낸 모든 메시지. 모두 컨텍스트 창 공간을 차지합니다.

## Context Window란 무엇인가?

Context window를 Claude가 메모리에 보관할 수 있는 공간의 양으로 생각하세요. 프롬프트를 입력하거나, Claude가 파일을 읽거나, 도구를 실행하거나, 도구 호출 결과를 받을 때마다 모두 context window에 추가됩니다. 유한한 공간이 있기 때문에 사용 방법을 최적화하는 것이 중요합니다.

![context window를 나타내는 다이어그램. 토큰 그리드로 표현되며 일부는 사용되고 대부분은 사용 가능합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686395%2Fvideo6contextwindowdiagram.1775686395676.jpg)

## Context가 가득 찰 때 어떻게 되나?

한계에 접근하면 context window는 자동으로 **압축됩니다(compacted)**. 압축은 중요한 세부사항을 요약하고 불필요한 도구 호출 결과를 제거하여 공간을 확보합니다. 이 과정이 세부사항을 잃을 수 있다는 점을 유의하세요.

![Claude Code가 "Compacting conversation..."을 표시하며 컨텍스트를 요약합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686393%2Fvideo6compactingcontext.1775686393619.jpg) ![Claude Code가 이전 대화, 주요 기술 개념, 파일의 압축 요약을 표시합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686394%2Fvideo6compactingsummary.1775686394575.jpg)

## Commands (명령)

`/compact` 명령으로 압축을 수동으로 실행할 수 있습니다. 이것은 그 지점까지의 모든 것을 압축합니다. context 공간을 확보하면서 이전에 작업한 항목의 메모리를 유지하고 싶을 때 편리합니다.

![Claude Code의 자동완성 메뉴의 /compact 명령](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686393%2Fvideo6compactcommand.1775686392964.jpg)

이전 세션의 메모리 없이 완전히 새로 시작하고 싶으면 `/clear`를 실행하세요. 이것은 모든 것을 제거합니다.

![컨텍스트를 새로 시작하기 위해 Claude Code에서 /clear 실행](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686392%2Fvideo6clearcommand.1775686392379.jpg)

컨텍스트 상태를 확인하려면 `/context` 명령을 실행하세요. 컨텍스트 크기, 가장 많은 공간을 차지하는 카테고리, 분석을 보여주는 시각적 그래픽의 개요를 얻을 수 있습니다.

![/context 명령의 출력, 시각적 막대 차트가 있는 context 사용 분석을 보여줍니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686364%2FVideo_2_01_01_11_11.1775686364258.jpg)

## When to Use Which (어떤 것을 언제 사용할지)

일반적인 경험칙은 다음과 같습니다:

- **`/compact` 사용:** 특정 기능을 작업 중이고 context 한계에 도달했지만 계속해야 할 때 사용하세요. 컨텍스트를 현재 기능과 관련있게 유지하는 것이 중요합니다.
- **`/clear` 사용:** 새로운 기능을 시작하고 싶을 때 사용하세요. 이전 대화가 새로운 것에 편견을 주지 않기를 원합니다. 세션 간에 Claude가 기억해야 할 것은 CLAUDE.md 파일에 넣으세요. 그렇게 하면 처음부터 다시 발견할 필요가 없습니다.

![명령, 중요한 메모, 아키텍처 섹션이 있는 CLAUDE.md 파일](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686391%2Fvideo6claudemdfile.1775686391669.jpg)

## Context 공간 절약 팁

**구체적으로 하세요.** 모호한 프롬프트는 더 작아 보일 수 있지만 실제로는 장기적으로 더 많은 컨텍스트 비용이 들어갑니다. 명확한 지침 없이 Claude는 코드베이스를 더 많이 탐색해야 하고 자체 추론을 해야 하므로 상세한 프롬프트보다 훨씬 더 많은 컨텍스트 공간을 차지합니다.

**MCP 서버를 관리하세요.** MCP 서버는 기본적으로 사용 중이지 않아도 사용 가능한 모든 도구를 context에 로드합니다. 현재 프로젝트와 관련 없는 것들을 위해 구성된 서버가 있으면 끄기를 고려하세요. "Skill"을 시도할 수도 있습니다. Skill은 MCP 서버와 유사하지만 시작할 때 모든 것을 context에 로드하지 않습니다.

**Subagent를 사용하세요.** Subagent는 메인 에이전트와 병렬로 실행되지만 완전히 별도의 컨텍스트 창을 가집니다. "인증 끝점이 어디에 있는가?"와 같이 답변만 필요한 작업의 경우 subagent가 작업을 수행하고 메인 에이전트에게 요약만 반환하여 기본 컨텍스트를 깨끗하게 유지합니다.

## 요약

Claude Code 내에서 컨텍스트를 관리하는 것은 중요합니다. 긴 세션을 요약하려면 `/compact`를 사용하고 새로 시작하려면 `/clear`를 사용하세요. 컨텍스트 창을 효과적으로 사용하려면: 프롬프트를 구체적으로 하고, 현재 컨텍스트를 소비하는 것을 확인하고, subagent를 사용하여 결과만 필요한 작업을 위임하세요.
