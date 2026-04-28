---
title: "Skills vs. other Claude Code features"
source: "https://anthropic.skilljar.com/introduction-to-agent-skills/434528"
author:
  - "[[the end of this lesson you'll be able to:]]"
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## 헤더 네비게이션

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  

**학습 내용**

*예상 소요 시간: 15분*

- *skill(스킬)을 CLAUDE.md, subagent(서브에이전트), hook(훅), MCP 서버와 비교하기*
- *주어진 사용 사례에 맞는 올바른 Claude Code 커스터마이제이션 기능 선택하기*
- *여러 기능을 효과적으로 결합하는 상호 보완적인 설정 설계하기*

## Skill vs. 다른 Claude Code 기능

*(3분)*

![](https://www.youtube.com/watch?v=IgNN4v0BJdU)

Claude Code는 여러 커스터마이제이션 옵션을 제공하며, 잘못된 옵션을 선택하면 불필요한 복잡성으로 이어질 수 있습니다. 이 비디오는 skill(스킬)을 CLAUDE.md, subagent(서브에이전트), hook(훅), MCP 서버와 비교하여 언제 어떤 것을 사용할지 분석합니다. 각 옵션 간의 주요 차이점과 일반적인 개발 설정에서 서로 보완하는 방법을 배웁니다.

#### 핵심 내용

- **CLAUDE.md**는 모든 대화에 로드되며 항상 켜진 프로젝트 표준에 적합합니다. **Skill(스킬)**은 온디맨드로 로드되며 작업별 전문 지식에 적합합니다
- **Subagent(서브에이전트)**는 격리된 실행 context(컨텍스트)에서 실행됩니다 - 위임된 작업에 사용합니다. **Skill(스킬)**은 현재 대화에 지식을 추가합니다
- **Hook(훅)**은 이벤트 드리븐입니다(파일 저장, 도구 호출 시 발생). **Skill(스킬)**은 요청 드리븐입니다(요청하는 것을 기반으로 활성화)
- **MCP 서버**는 외부 도구와 통합을 제공합니다 - skill(스킬)과 완전히 다른 범주입니다
- 각 기능이 자체 전문 분야를 처리합니다 - **하나에 모든 것을 강제하기보다는 결합하세요**

Claude Code는 여러 커스터마이제이션 옵션을 제공합니다: Skill(스킬), CLAUDE.md, subagent(서브에이전트), hook(훅), MCP 서버. 각각 다른 문제를 해결하며, 각각을 언제 사용할지 아는 것은 잘못된 것을 만드는 것을 방지합니다. 분석해봅시다.

## CLAUDE.md vs. Skill(스킬)

CLAUDE.md는 항상 모든 대화에 로드됩니다. 프로젝트에서 TypeScript strict 모드를 사용하길 원한다면 CLAUDE.md에 넣으세요.

Skill(스킬)은 온디맨드로 로드됩니다. Claude가 요청을 skill(스킬)과 매칭하면 그 skill(스킬)의 지침이 대화에 참여합니다. PR 검토 체크리스트는 새 코드를 작성할 때 context(컨텍스트)에 있을 필요가 없습니다 - 검토를 요청할 때 활성화됩니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527266%2FSkills4_06.1771527266559.png)

**CLAUDE.md 사용:**

- 항상 적용되는 프로젝트 전체 표준
- "데이터베이스 스키마를 수정하지 마세요" 같은 제약
- 프레임워크 선호도 및 코딩 스타일

**Skill(스킬) 사용:**

- 작업별 전문 지식
- 때때로만 관련성이 있는 지식
- 모든 대화를 어수선하게 만들 상세 절차

## Skill(스킬) vs. Subagent(서브에이전트)

Skill(스킬)은 현재 대화에 지식을 추가합니다. Skill(스킬)이 활성화되면 지침이 기존 context(컨텍스트)에 참여합니다.

Subagent(서브에이전트)는 별도 context(컨텍스트)에서 실행됩니다. 작업을 받고, 독립적으로 작업하며, 결과를 반환합니다. 메인 대화와 격리됩니다.

**Subagent(서브에이전트) 사용 시기:**

- 작업을 별도의 실행 context(컨텍스트)에 위임하고 싶을 때
- 메인 대화와 다른 도구 접근이 필요할 때
- 위임된 작업과 메인 context(컨텍스트) 간 격리를 원할 때

**Skill(스킬) 사용 시기:**

- 현재 작업을 위한 Claude의 지식을 향상시키고 싶을 때
- 전문 지식이 대화 전반에 적용될 때

## Skill(스킬) vs. Hook(훅)

Hook(훅)은 이벤트 시 발생합니다. Hook(훅)은 Claude가 파일을 저장할 때마다 린터를 실행하거나, 특정 도구 호출 전 입력을 검증할 수 있습니다. 이벤트 드리븐입니다.

Skill(스킬)은 요청 드리븐입니다. 요청하는 것을 기반으로 활성화됩니다.

**Hook(훅) 사용:**

- 모든 파일 저장 시 실행해야 하는 작업
- 특정 도구 호출 전 검증
- Claude 작업의 자동화된 부작용

**Skill(스킬) 사용:**

- Claude의 요청 처리 방식에 영향을 미치는 지식
- Claude의 추론에 영향을 미치는 가이드라인

## 모두 함께 배치하기

일반적인 설정은 다음을 포함할 수 있습니다:

- **CLAUDE.md** - 항상 켜진 프로젝트 표준
- **Skill(스킬)** - 온디맨드로 로드되는 작업별 전문 지식
- **Hook(훅)** - 이벤트로 트리거되는 자동화된 작업
- **Subagent(서브에이전트)** - 위임된 작업을 위한 격리된 실행 context(컨텍스트)
- **MCP** - 외부 도구 및 통합

각각이 자체 전문 분야를 처리합니다. 다른 옵션이 더 잘 맞을 때 모든 것을 skill(스킬)에 강제하지 마세요 - 그리고 여러 개를 한 번에 사용할 수 있습니다. Skill(스킬)은 주제가 관련성이 있을 때 자동으로 적용되는 작업별 전문 지식을 제공하고, CLAUDE.md는 항상 켜진 지침을 위한 것이고, subagent(서브에이전트)는 격리된 context(컨텍스트)에서 실행되고, hook(훅)은 이벤트로 발생하고, MCP는 외부 도구를 제공합니다.

Claude가 자동으로 지식을 적용해야 할 때 skill(스킬)을 사용하고, 포괄적인 커스터마이제이션을 위해 다른 기능과 결합합니다.

## 수업 성찰

- 현재 CLAUDE.md 파일을 살펴보세요. Skill(스킬)으로 더 잘 작동할 것이 있나요 (관련성이 있을 때만 로드)?
- 팀의 개발 워크플로우를 생각해보세요. Claude Code 기능(skill(스킬), hook(훅), subagent(서브에이전트), MCP)의 어떤 조합이 가장 일반적인 문제를 해결할까요?

## 다음 단계

다음 수업에서는 skill(스킬)을 팀 및 조직과 공유하는 방법 - 저장소에 커밋하기부터 플러그인을 통한 배포, enterprise(엔터프라이즈) 관리 설정을 통한 조직 전체 배포까지 - 를 배웁시다.

#### 피드백

과정을 진행하면서 skill(스킬)을 어떻게 사용하고 있는지와 피드백이 있으면 알려주세요. [여기](https://forms.gle/RvHPBwQt9ZmcDc1P9)에서 피드백을 공유하세요.
