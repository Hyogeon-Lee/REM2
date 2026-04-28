---
title: "What are skills?"
source: "https://anthropic.skilljar.com/introduction-to-agent-skills/434525"
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

- *Claude Code skill(스킬)이 무엇이며 어떻게 동작하는지 정의하기*
- *Skill이 어디에 위치하는지 설명하기 (개인용 vs. 프로젝트 디렉토리)*
- *Skill, CLAUDE.md, 슬래시 명령어 구별하기*
- *Skill이 적합한 커스터마이제이션 도구인 경우 식별하기*

## Skill이란 무엇인가?

*(3분)*

![](https://www.youtube.com/watch?v=bjdBVZa66oU)

이 비디오는 skill(스킬), 즉 Claude Code가 특정 작업을 자동으로 처리하는 방법을 가르치는 재사용 가능한 마크다운 파일을 소개합니다. PR을 검토하거나 커밋 메시지를 작성하도록 요청할 때마다 지침을 반복하는 대신, skill을 한 번 작성하면 해당 작업이 발생할 때마다 Claude가 이를 적용합니다. 이 비디오는 skill이 무엇인지, 어디에 위치하는지, 다른 Claude Code 커스터마이제이션 옵션과 어떻게 비교되는지를 다룹니다.

#### 핵심 내용

- **Skill은 지침이 담긴 폴더**로, Claude Code가 작업을 더 정확하게 처리하도록 발견하고 사용할 수 있습니다. 각 skill은 frontmatter(프론트매터)에 이름과 설명이 있는 `SKILL.md` 파일에 위치합니다
- **Claude는 설명을 사용하여 skill을 요청에 매칭합니다.** Claude에게 무언가를 해달라고 요청하면, Claude는 요청을 사용 가능한 skill 설명들과 비교하여 일치하는 것을 활성화합니다
- **개인용 skill**은 `~/.claude/skills`에 위치하며 모든 프로젝트에서 따라다닙니다. **프로젝트 skill**은 저장소 내부의 `.claude/skills`에 위치하며 저장소를 복제하는 모든 사람과 공유됩니다
- **Skill은 온디맨드(on-demand)로 로드됩니다** — 모든 대화에 로드되는 CLAUDE.md나 명시적 호출이 필요한 슬래시 명령어와 달리, skill은 Claude가 상황을 인식할 때 자동으로 활성화됩니다
- 같은 내용을 Claude에게 **반복해서 설명하고 있다면**, 그것이 바로 작성을 기다리고 있는 skill입니다

팀의 코딩 표준을 Claude에게 설명할 때마다 같은 말을 반복하고 있습니다. PR 검토 때마다 피드백을 어떤 구조로 받고 싶은지 다시 설명합니다. 커밋 메시지마다 선호하는 형식을 Claude에게 상기시킵니다. Skill이 이 문제를 해결합니다.

Skill은 무언가를 하는 방법을 Claude에게 한 번만 가르치는 마크다운 파일입니다. 그러면 Claude는 관련성이 있을 때마다 자동으로 그 지식을 적용합니다.

## Skill이란 무엇인가

Skill은 Claude Code가 발견하고 사용하여 작업을 더 정확하게 처리할 수 있도록 하는 지침과 리소스가 담긴 폴더입니다. 각 skill은 frontmatter에 이름과 설명이 있는 `SKILL.md` 파일에 위치합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527257%2FSkills1_05.1771527257795.png)

설명은 Claude가 skill을 사용할지 여부를 결정하는 방식입니다. Claude에게 PR 검토를 요청하면, Claude는 요청을 사용 가능한 skill 설명들과 매칭하여 관련 있는 것을 찾습니다. Claude는 요청을 읽고, 사용 가능한 모든 skill 설명과 비교한 후, 일치하는 것을 활성화합니다.

Skill의 frontmatter는 다음과 같은 모습입니다:

```js
---
name: pr-review
description: Reviews pull requests for code quality. Use when reviewing PRs or checking code changes.
---
```

Frontmatter 아래에는 실제 지침을 작성합니다. 검토 체크리스트, 포매팅 선호도, 또는 그 작업을 위해 Claude가 알아야 할 모든 것이 여기에 들어갑니다.

## Skill이 위치하는 곳

누구에게 필요한지에 따라 skill을 다른 위치에 저장할 수 있습니다:

- **개인용 skill**은 `~/.claude/skills`(홈 디렉토리)에 위치합니다. 모든 프로젝트에서 따라다닙니다 — 커밋 메시지 스타일, 문서 형식, 코드를 설명받기 원하는 방식 등입니다.
- **프로젝트 skill**은 저장소의 루트 디렉토리 내부 `.claude/skills`에 위치합니다. 저장소를 복제하는 모든 사람이 이 skill을 자동으로 얻습니다. 회사의 브랜드 가이드라인, 웹 디자인용 선호 글꼴과 색상 같은 팀 표준이 여기에 위치합니다.

Windows에서 개인용 skill은 `C:/Users/<your-user>/.claude/skills`에 위치합니다.

프로젝트 skill은 코드와 함께 버전 관리에 커밋되므로 팀 전체가 이를 공유합니다.

## Skill vs. CLAUDE.md vs. 슬래시 명령어

Claude Code에는 동작을 커스터마이즈하는 여러 가지 방법이 있습니다. Skill은 자동으로 동작하면서도 작업별로 특화되어 있다는 점에서 독특합니다. 비교해봅시다:

- **CLAUDE.md** 파일은 모든 대화에 로드됩니다. Claude가 항상 TypeScript의 strict 모드를 사용하길 원한다면 CLAUDE.md에 넣으세요.
- **Skill**은 요청과 매칭될 때 온디맨드로 로드됩니다. Claude는 처음에 이름과 설명만 로드하므로 전체 컨텍스트 윈도우를 채우지 않습니다. PR 검토 체크리스트는 디버깅 중일 때 컨텍스트에 있을 필요가 없으며, 실제로 검토를 요청할 때 로드됩니다.
- **슬래시 명령어**는 명시적으로 입력해야 합니다. Skill은 그럴 필요가 없습니다. Claude는 상황을 인식할 때 이를 적용합니다.

Claude가 skill을 요청과 매칭하면 터미널에서 로드되는 모습을 볼 수 있습니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527259%2FSkills1_17.1771527259668.png)

## Skill을 사용해야 하는 경우

Skill은 특정 작업에 적용되는 전문 지식에 가장 적합합니다:

- 팀이 따르는 코드 검토 표준
- 선호하는 커밋 메시지 형식
- 조직의 브랜드 가이드라인
- 특정 유형의 문서를 위한 문서 템플릿
- 특정 프레임워크용 디버깅 체크리스트

경험칙은 간단합니다: 같은 내용을 Claude에게 반복해서 설명하고 있다면, 그것이 바로 작성을 기다리고 있는 skill입니다.

## 수업 성찰

- Claude Code와의 가장 최근 상호작용을 떠올려 보세요. 반복해서 설명하고 있던 지침은 어떤 것들이었나요? Skill이 시간을 어떻게 절약해줄 수 있었을까요?
- 팀의 워크플로우를 생각해보세요. 어떤 표준이나 프로세스가 skill로 인코딩되면 가장 큰 이점을 얻을까요?

## 다음 단계

다음 수업에서는 처음부터 첫 skill을 만들어 보고, Claude Code가 skill을 어떻게 발견하고 매칭하며 로드하는지 그 이면을 살펴봅니다.

#### 피드백

과정을 진행하면서 업무에서 skill을 어떻게 사용하고 있는지, 그리고 피드백이 있으면 알려주세요. [여기](https://forms.gle/RvHPBwQt9ZmcDc1P9)에서 피드백을 공유하세요.
