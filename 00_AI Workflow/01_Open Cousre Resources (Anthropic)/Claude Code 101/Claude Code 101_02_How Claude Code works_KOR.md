---
title: "Claude Code가 작동하는 방식"
source: "https://anthropic.skilljar.com/claude-code-101/469789"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Claude Code는 일반적인 채팅 애플리케이션과 다릅니다. 내부적으로 어떻게 작동하는지 이해하면 더 효과적으로 사용할 수 있습니다.

## Agentic Loop (에이전트 루프)

Claude Code는 **agentic loop**를 통해 가장 잘 설명됩니다:

1. Claude Code에 프롬프트를 입력합니다.
2. Claude는 모델과 상호작용하여 필요한 컨텍스트를 수집하며, 모델은 Claude Code가 실행할 수 있는 텍스트 또는 도구 호출을 반환합니다.
3. 행동을 취합니다. 예를 들어, 파일을 편집하거나 명령을 실행합니다.
4. 결과를 확인하고 프롬프트에서 설정한 목표를 달성했는지 판단합니다.
5. 목표를 달성했으면 완료하고 다음 프롬프트를 기다립니다. 달성하지 못했으면 루프를 돌아서 결과가 완전하고 검증 가능할 때까지 다시 시도합니다.

이 루프 전반에 걸쳐, 사용자는 컨텍스트를 추가하거나, 작업을 중단하거나, 모델의 방향을 조정(steer)하여 목표 달성을 도울 수 있습니다.

![Agentic loop의 다이어그램: 프롬프트가 컨텍스트 수집, 행동, 결과 검증 루프로 흘러가며, 어느 지점에서나 개입하고, 조정하거나, 컨텍스트를 추가할 수 있습니다.](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686365%2Fagenticloop.1775686365141.jpg)

## Context (컨텍스트)

Claude는 대화, 파일 내용, 명령 출력 등을 얼마나 저장하고 참조할 수 있는지를 결정하는 **context window**(컨텍스트 창)를 가지고 있습니다. 한계에 도달하면 Claude Code는 대화를 자동으로 compaction(압축)합니다. 즉, 제거하거나 요약할 수 있는 항목을 자동으로 판단하여 컨텍스트 창을 다시 사용 가능한 크기로 줄입니다.

## Tools (도구)

도구(tool)는 에이전트가 작동하는 방식의 근간입니다. 대부분의 AI 어시스턴트는 단순히 텍스트를 받아 텍스트를 반환합니다. 도구는 Claude Code가 작업 완료에 더 가까워지기 위해 코드를 실행할 *시기*를 결정할 수 있게 해줍니다. 파일 읽기 도구, 웹 검색 도구, 그 밖의 다양한 기능이 될 수 있습니다. Claude Code는 의미론적 이해를 활용하여 도구를 언제 호출할지, 그리고 그 출력을 어떻게 사용할지를 결정합니다.

## Permissions (권한)

Claude Code는 여러 권한 모드를 가지고 있습니다:

- **기본 동작:** Claude는 파일을 편집하거나 쉘 명령을 실행하기 전에 명시적 권한을 요청합니다.
- **자동 수락:** 파일은 요청 없이 편집되지만 명령은 여전히 승인이 필요합니다.
- **Plan Mode (계획 모드):** 읽기 전용 도구를 사용하여 작업을 시작하기 전에 행동 계획을 작성합니다.
![Claude Code가 bash 명령을 실행하기 전에 권한을 요청합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686376%2Fvideo2ask.1775686376586.jpg)

이 모든 것은 설정 파일에서 구성할 수 있습니다. 권한 확인을 건너뛸 때는 주의하세요. Claude Code에 명령을 실행할 전권을 주면, 실수가 일어나기 전에 발견하기 더 어려워집니다.

## 요약

Claude Code는 여러 agentic 개념, 즉 agentic loop, 관리되는 context window, 도구, 구성 가능한 권한 모드를 결합하며, 이 모두가 터미널 안에서 작동합니다. 코드베이스를 읽고, 행동을 취하고, 스스로의 작업을 검증할 수 있습니다. 이것이 일반 채팅 창과 근본적으로 다른 점입니다.
