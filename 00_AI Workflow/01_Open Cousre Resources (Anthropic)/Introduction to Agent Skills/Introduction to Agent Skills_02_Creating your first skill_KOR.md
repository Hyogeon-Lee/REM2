---
title: "Creating your first skill"
source: "https://anthropic.skilljar.com/introduction-to-agent-skills/434527"
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

*예상 소요 시간: 20분*

- *적절한 frontmatter(프론트매터) 구조로 처음부터 skill(스킬) 만들기*
- *Skill이 Claude Code에서 올바르게 로드되는지 테스트하고 확인하기*
- *Claude Code가 들어오는 요청을 사용 가능한 skill에 어떻게 매칭하는지 설명하기*
- *Skill 우선순위 계층 설명하기 (Enterprise, Personal, Project, Plugins)*

## 첫 번째 skill 만들기

*(4분)*

![](https://www.youtube.com/watch?v=Wx6_vjFFyHM)

이 비디오는 모든 프로젝트에서 작동하는 개인용 PR 설명 skill(스킬)을 처음부터 만드는 과정을 따라가 봅니다. SKILL.md 파일을 어떻게 구성하는지, 이를 어떻게 테스트하는지, 그리고 Claude Code가 skill을 어떻게 발견하고 요청에 매칭하는지 정확히 보게 됩니다. 또한 이름이 충돌할 때 어떤 skill이 우선하는지 결정하는 우선순위 계층도 다룹니다.

#### 핵심 내용

- Skill은 **frontmatter(프론트매터)에 메타데이터(이름, 설명)가, 그 아래에 지침이 담긴 `SKILL.md` 파일을 포함하는 디렉토리**입니다
- Claude는 **시작(startup) 시 skill 이름과 설명만 로드**한 후, semantic matching(시맨틱 매칭)을 사용해 들어오는 요청을 그 설명들에 매칭합니다
- Claude가 skill 전체 내용을 컨텍스트에 로드하기 전에 **확인 프롬프트가 표시됩니다**
- 이름 충돌 시 우선순위: **Enterprise → Personal → Project → Plugins**
- Skill을 업데이트하려면 해당 `SKILL.md`를 편집하세요. 제거하려면 그 디렉토리를 삭제하세요. **변경 사항을 적용하려면 항상 Claude Code를 다시 시작하세요**

처음부터 skill을 만드는 과정을 살펴본 후, Claude Code가 실제로 skill을 어떻게 로드하고 매칭하는지 그 이면을 살펴봅시다.

## Skill 만들기

일관된 형식으로 PR 설명을 작성하도록 Claude에게 가르치는 개인용 skill을 만들어 봅니다. 개인용 skill이므로 홈 디렉토리에 위치하며 모든 프로젝트에서 작동합니다.

먼저 skills 폴더 내부에 skill을 위한 디렉토리를 만듭니다. 디렉토리 이름은 skill 이름과 일치해야 합니다:

```js
mkdir -p ~/.claude/skills/pr-description
```

그런 다음 해당 디렉토리 내에 `SKILL.md` 파일을 만듭니다. 이 파일은 frontmatter 대시로 구분된 두 부분으로 구성됩니다:

```js
---
name: pr-description
description: Writes pull request descriptions. Use when creating a PR, writing a PR, or when the user asks to summarize changes for a pull request.
---

When writing a PR description:

1. Run \`git diff main...HEAD\` to see all changes on this branch
2. Write a description following this format:

## What
One sentence explaining what this PR does.

## Why
Brief context on why this change is needed

## Changes
- Bullet points of specific changes made
- Group related changes together
- Mention any files deleted or renamed
```

**name(이름)**은 skill을 식별합니다. **description(설명)**은 Claude에게 언제 이를 사용할지 알려줍니다 — 이것이 매칭 기준입니다. 두 번째 대시 묶음 이후의 모든 내용은 skill이 활성화될 때 Claude가 따르는 지침입니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527260%2FSkills2_04.1771527260186.png)

## Skill 테스트하기

Claude Code는 시작 시 skill을 로드하므로, 하나를 만든 후에는 세션을 다시 시작하세요. 사용 가능한 skill 목록을 확인하여 skill이 사용 가능한지 검증할 수 있습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527260%2FSkills2_05.1771527260555.png)

Skill이 목록에 나타나야 합니다. 테스트하려면 브랜치에서 변경을 좀 한 다음 "내 변경 사항에 대한 PR 설명을 작성해줘"와 같이 말해 보세요. Claude는 PR 설명 skill을 사용하고 있음을 표시하고, diff를 확인하며, 템플릿을 따라 설명을 작성합니다 — 매번 동일한 형식으로요.

## Skill 매칭이 작동하는 방식

Claude Code가 시작될 때 skill을 찾기 위해 네 가지 위치를 스캔하지만, **이름과 설명만 로드**하고 전체 내용은 로드하지 않습니다. 이는 중요한 세부사항입니다.

요청을 보내면 Claude는 사용자의 메시지를 사용 가능한 모든 skill의 설명과 비교합니다. 예를 들어, "이 함수가 무엇을 하는지 설명해줘"는 "시각적 다이어그램으로 코드를 설명한다"라고 기술된 skill과 매칭됩니다. 의도가 겹치기 때문입니다.

매칭이 발견되면 Claude는 skill을 로드해도 되는지 확인을 요청합니다. 이 확인 단계는 Claude가 어떤 컨텍스트를 끌어오고 있는지 사용자가 항상 인식하도록 해줍니다. 사용자가 확인하면 Claude는 전체 `SKILL.md` 파일을 읽고 그 지침을 따릅니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527261%2FSkills2_17.1771527261842.png)

## Skill 우선순위

만약 본인의 개인용 skill 중 하나와 같은 이름의 skill을 가진 저장소를 복제한다면, 어떤 것이 우선할까요? 명확한 우선순위 순서가 있습니다:

1. **Enterprise** — 관리되는 설정, 최고 우선순위
2. **Personal** — 홈 디렉토리 (`~/.claude/skills`)
3. **Project** — 저장소 내부의 `.claude/skills` 디렉토리
4. **Plugins** — 설치된 플러그인, 가장 낮은 우선순위

이를 통해 조직은 enterprise(엔터프라이즈) skill로 표준을 강제하면서도 개별 커스터마이제이션을 허용할 수 있습니다. 회사에 enterprise "code-review" skill이 있고 같은 이름의 개인용 "code-review" skill을 만들면, enterprise 버전이 우선합니다.

충돌을 피하려면 서술적인 이름을 사용하세요. 단순히 "review"가 아니라 "frontend-review"나 "backend-review" 같은 이름을 사용하세요.

## Skill 업데이트 및 제거

Skill을 업데이트하려면 해당 `SKILL.md` 파일을 편집하세요. 제거하려면 그 디렉토리를 삭제하세요. 변경 사항을 적용하려면 변경 후 Claude Code를 다시 시작하세요.

## 수업 성찰

- 지금 당장 skill로 만들 수 있는 일상 워크플로우 작업이 있다면 무엇인가요? 그 description은 어떤 모습일까요?
- 우선순위 계층이 팀의 skill 관리 전략에 어떤 영향을 미칠까요? 개인용 skill과 프로젝트 수준 skill 중 어디에 더 의존하시겠어요?

## 다음 단계

다음 수업에서는 고급 구성 옵션 — 메타데이터 필드, `allowed-tools`를 사용한 도구 제한, progressive disclosure(점진적 공개)와 multi-file(다중 파일) 구조를 사용한 더 큰 skill 구성 방법 — 을 배웁니다.

#### 피드백

과정을 진행하면서 업무에서 skill을 어떻게 사용하고 있는지, 그리고 피드백이 있으면 알려주세요. [여기](https://forms.gle/RvHPBwQt9ZmcDc1P9)에서 피드백을 공유하세요.
