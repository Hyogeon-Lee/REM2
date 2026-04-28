---
title: "Sharing skills"
source: "https://anthropic.skilljar.com/introduction-to-agent-skills/434529"
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

  

## Skill(스킬) 공유하기

**학습 내용**

*예상 소요 시간: 20분*

- *Git 저장소에 커밋하여 팀과 skill(스킬) 공유하기*
- *플러그인과 마켓플레이스를 통해 프로젝트 전반에 걸쳐 skill(스킬) 배포하기*
- *enterprise(엔터프라이즈) 관리 설정을 사용하여 조직 전체에 skill(스킬) 배포하기*
- *특정 skill(스킬)을 사용하도록 custom subagent(커스텀 서브에이전트) 구성하기*

## Skill(스킬) 공유하기

*(4분)*

![](https://www.youtube.com/watch?v=OCBi3eScNLk)

Skill(스킬)은 팀 또는 조직 전체에 공유할 때 훨씬 더 가치 있어집니다. 이 비디오는 세 가지 주요 배포 방법 - 저장소 커밋, 플러그인, enterprise(엔터프라이즈) 관리 설정 - 과 custom subagent(커스텀 서브에이전트)를 skill(스킬)을 사용하도록 구성하는 방법을 다룹니다. 각 방법이 어떤 시나리오에 적합한지와 중요한 주의사항(subagent(서브에이전트)가 자동으로 skill(스킬)을 상속하지 않는다)을 배웁니다.

#### 핵심 내용

- **`.claude/skills`의 프로젝트 skill(스킬)**은 Git을 통해 자동으로 공유됩니다 - 저장소를 복제하는 모든 사람이 이를 얻습니다
- **플러그인**을 사용하면 마켓플레이스를 통해 더 광범위한 커뮤니티 사용을 위해 저장소 전반에 skill(스킬)을 배포할 수 있습니다
- **Enterprise(엔터프라이즈) 관리 설정**은 최고 우선순위로 조직 전체에 skill(스킬)을 배포합니다. 필수 표준과 규정 준수에 이상적입니다
- **Subagent(서브에이전트)는 자동으로 당신의 skill(스킬)을 보지 못합니다** - custom agent(커스텀 에이전트)의 frontmatter(프론트매터) `skills` 필드에 명시적으로 나열해야 합니다
- Built-in agent(내장 에이전트)(Explorer, Plan, Verify) **는 skill(스킬)에 접근할 수 없습니다** - `.claude/agents`에 정의된 custom subagent(커스텀 서브에이전트)만 가능합니다

Skill(스킬)은 공유할 때 훨씬 더 가치 있어집니다. 당신만 사용하는 PR 검토 skill(스킬)은 도움이 되지만, 전체 팀에 공유되는 같은 skill(스킬)은 코드 검토를 표준화하고 조직 전체에 일관된 경험을 만듭니다. Skill(스킬)을 배포하는 다른 방법들을 살펴봅시다.

## Skill(스킬)을 저장소에 커밋하기

가장 간단한 공유 방법은 skill(스킬)을 저장소에 직접 커밋하는 것입니다. `.claude/skills`에 넣으면 저장소를 복제하는 모든 사람이 자동으로 이를 얻습니다 - 추가 설치가 필요 없습니다.

업데이트를 푸시하면 모든 사람이 다음 풀에서 이를 얻습니다. 이 접근법은 다음에 잘 작동합니다:

- 팀 코딩 표준
- 프로젝트별 워크플로우
- 코드베이스 구조를 참조하는 skill(스킬)

`.claude` 디렉토리는 agent(에이전트), hook(훅), skill(스킬), 설정을 포함합니다 - 모두 버전 관리되며 일반적인 Git 워크플로우를 통해 팀과 공유됩니다.

## 플러그인을 통해 Skill(스킬) 배포하기

플러그인은 팀 및 프로젝트 전반에 공유되도록 설계된 custom functionality(커스텀 기능)로 Claude Code를 확장하는 방법입니다. 플러그인 프로젝트에서 `.claude` 디렉토리와 유사한 파일 구조를 따르는 `skills` 디렉토리를 만듭니다 - 각 skill(스킬)은 내부에 `SKILL.md` 파일을 가진 자체 폴더를 얻습니다.

플러그인을 마켓플레이스에 배포한 후 다른 사용자가 이를 발견하고 자신을 위해 Claude Code에 설치할 수 있습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527270%2FSkills5_07.1771527270067.png)

이 접근법은 당신의 skill(스킬)이 지나치게 프로젝트 특화되지 않았고 직접 팀 외 커뮤니티 멤버에게 유용할 수 있을 때 가장 좋습니다.

## Enterprise(엔터프라이즈) 관리 설정을 통한 배포

관리자는 관리 설정을 통해 조직 전체에 skill(스킬)을 배포할 수 있습니다. Enterprise(엔터프라이즈) skill(스킬)은 최고 우선순위를 취합니다 - 같은 이름의 개인용, 프로젝트, 플러그인 skill(스킬)을 재정의합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527270%2FSkills5_08.1771527270381.png)

관리 설정 파일은 플러그인을 설치할 수 있는 위치를 제어하는 `strictKnownMarketplaces` 같은 기능을 지원합니다:

```js
"strictKnownMarketplaces": [
  {
    "source": "github",
    "repo": "acme-corp/approved-plugins"
  },
  {
    "source": "npm",
    "package": "@acme-corp/compliance-plugins"
  }
]
```

이는 필수 표준, 보안 요구사항, 규정 준수 워크플로우, 그리고 조직 전체에서 *반드시* 일관성이 있어야 하는 코딩 관행에 올바른 선택입니다. 여기서 핵심 단어는 "must"입니다.

## Skill(스킬)과 Subagent(서브에이전트)

다음은 사람들을 깜짝 놀라게 합니다: subagent(서브에이전트)는 자동으로 당신의 skill(스킬)을 보지 못합니다. 작업을 subagent(서브에이전트)에 위임할 때 깨끗한 새 context(컨텍스트)로 시작합니다.

이해해야 할 중요한 구별이 있습니다:

- **Built-in agent(내장 에이전트)**(예: Explorer, Plan, Verify)는 skill(스킬)에 접근할 수 없습니다
- **당신이 정의한 custom subagent(커스텀 서브에이전트)**는 skill(스킬)을 사용할 수 있지만, 명시적으로 나열할 때만 가능합니다
- Skill(스킬)은 메인 대화와 달리 subagent(서브에이전트)가 시작될 때 로드됩니다. 온디맨드가 아닙니다

Custom subagent(커스텀 서브에이전트)를 skill(스킬)과 함께 만들려면 `.claude/agents`에 agent markdown file(에이전트 마크다운 파일)을 추가합니다. Claude Code에서 `/agents` 명령을 사용하여 상호작용적으로 만들 수 있습니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527270%2FSkills5_13.1771527270779.png)

생성된 agent file(에이전트 파일)은 로드할 skill(스킬)을 나열하는 `skills` 필드를 포함합니다. Frontmatter(프론트매터)는 다음과 같은 모습입니다:

```js
---
name: frontend-security-accessibility-reviewer
description: "Use this agent when you need to review frontend code for accessibility..."
tools: Bash, Glob, Grep, Read, WebFetch, WebSearch, Skill...
model: sonnet
color: blue
skills: accessibility-audit, performance-check
---
```

이 subagent(서브에이전트)에 위임할 때 두 skill(스킬) 모두 로드되고 모든 검토에 적용됩니다. 먼저 skill(스킬)이 `.claude/skills` 디렉토리에 있는지 확인하고, 새로운 subagent(서브에이전트)를 만들거나 기존 agent(에이전트)의 마크다운 파일에 `skills` 필드를 추가하세요.

이 패턴은 다음과 같은 경우에 정말 잘 작동합니다:

- 격리된 작업 위임과 특정 전문 지식을 원할 때
- 서로 다른 subagent(서브에이전트)가 서로 다른 skill(스킬)이 필요할 때 (frontend(프론트엔드) 검토자 vs. backend(백엔드) 검토자)
- 프롬프트에 의존하지 않고 위임된 작업에 표준을 강제하고 싶을 때

## 수업 성찰

- 어떤 공유 방법(저장소, 플러그인, enterprise(엔터프라이즈))이 당신이 만들 생각을 하고 있는 skill(스킬)에 가장 타당한가요?
- Custom subagent(커스텀 서브에이전트)와 특정 skill(스킬)이 위임된 작업의 일관성을 개선할 워크플로우가 있나요?

## 다음 단계

최종 수업에서는 일반적인 skill(스킬) 문제를 해결하는 방법 - skill(스킬)이 트리거되지 않는 것부터 우선순위 충돌, 런타임 오류까지 - 과 언제든지 참조할 수 있는 실용적인 체크리스트를 배웁시다.

#### 피드백

과정을 진행하면서 skill(스킬)을 어떻게 사용하고 있는지와 피드백이 있으면 알려주세요. [여기](https://forms.gle/RvHPBwQt9ZmcDc1P9)에서 피드백을 공유하세요.
