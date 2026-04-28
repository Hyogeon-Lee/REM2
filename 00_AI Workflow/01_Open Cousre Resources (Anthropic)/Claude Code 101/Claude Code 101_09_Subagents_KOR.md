---
title: "Subagent (서브에이전트)"
source: "https://anthropic.skilljar.com/claude-code-101/469796"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Claude는 작업을 분해하고 컴포넌트 작업을 병렬로 실행하는 subagent에 작업을 위임할 수 있으며, 컨텍스트 관리를 개선합니다. 각 subagent는 자신의 격리된 컨텍스트 창에서 작동합니다.

## 작동 원리

Claude Code에서 컨텍스트를 관리하는 것은 중요합니다. 컨텍스트 창의 대부분은 코드베이스를 탐색하는 도구 호출이나 연구를 위한 웹 검색과 같은 것에 의해 소비됩니다. Claude가 그 탐색 중에 발견한 것이 개발하는 주요 기능과 항상 관련이 있는 것은 아닙니다.

이것이 subagent가 들어오는 곳입니다. Claude는 "코드베이스를 탐색하기"와 같은 작업을 처리하기 위해 subagent를 생성합니다. Subagent는 자신의 컨텍스트 창과 병렬로 실행되고, 모든 탐색 작업을 수행하고, 완료되면 결과를 요약하고 Claude에게 반환합니다.

결과: 당신이 찾던 답을 얻지만, 그곳에 도달하는 전체 여정이 메인 컨텍스트를 어지럽히지 않습니다.

## Subagent 생성

Subagent는 YAML 앞면 기호가 있는 Markdown 파일로 정의됩니다. 시작하는 가장 쉬운 방법은 Claude가 하나를 생성하도록 하는 것입니다. 다음을 실행하세요:

```js
/agents
```

그 다음 "Create new agent"를 선택하세요. 에이전트의 범위를 선택하고, 목적을 정의하고, 접근할 수 있는 도구를 선택하고, 심지어 색상을 선택하는 등의 단계를 거치게 됩니다.

Claude가 subagent의 이름, 설명, 프롬프트를 생성합니다. 이것은 또한 제공한 프롬프트에 따라 subagent를 호출할 시기를 Claude에게 알립니다.

## 추가 사용자 지정

Subagent는 더 사용자 지정할 수 있습니다. 몇 가지 주요 사항은 다음과 같습니다:

- **Persistent memory**는 subagent가 대화 간에 메모리를 유지하도록 합니다. 동일한 프로젝트에서 지속적으로 사용하는 경우 좋습니다.
- **Preload skills**을 `skill` 키를 추가하고 이름별로 skill을 나열하여 subagent에 추가하세요. 메인 대화의 skill과 달리 전체 skill이 여기서 컨텍스트에 로드됩니다.

## 요약

Claude Code를 생산적으로 유지하는 가장 좋은 방법 중 하나는 컨텍스트 창을 깨끗하게 유지하는 것입니다. Subagent를 사용하면 백그라운드에서 에이전트를 실행하여 무거운 작업을 처리하고 답변만 메인 컨텍스트 창에 반환할 수 있습니다.

**더 깊이 들어가고 싶나요?** 전용 과정을 확인하세요: [Introduction to subagents](https://anthropic.skilljar.com/introduction-to-subagents)
