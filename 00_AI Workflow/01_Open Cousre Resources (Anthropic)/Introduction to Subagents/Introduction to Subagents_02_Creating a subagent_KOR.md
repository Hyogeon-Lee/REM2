---
title: "Creating a subagent"
source: "https://anthropic.skilljar.com/introduction-to-subagents/450699"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
Claude Code는 내장 subagent를 제공하지만, 직접 자신만의 subagent도 만들 수 있습니다. 커스텀 subagent는 코드 리뷰, 테스트 작성, 문서 점검 같은 특정 작업에 특화됩니다. Subagent는 YAML frontmatter(프론트매터)를 포함한 마크다운 파일로 정의되며, 이 frontmatter는 Claude에게 subagent를 언제 사용해야 하는지와 subagent가 어떻게 동작해야 하는지를 알려줍니다.

Subagent를 만드는 가장 쉬운 방법은 `/agents` 슬래시 명령을 사용하는 것입니다. 이 명령은 subagent를 관리하는 메인 인터페이스를 엽니다. 거기서 **Create new agent**를 선택합니다.

먼저 subagent의 범위(scope)를 선택하라는 안내가 나옵니다:

- **Project-level** -- 현재 프로젝트에서만 사용 가능
- **User-level** -- 사용자 컴퓨터의 모든 프로젝트에서 공유

다음으로 생성 방식을 선택할 수 있습니다. 설정을 수동으로 작성할 수도 있지만, 권장 방식은 Claude가 생성하도록 맡기는 것입니다. Subagent가 해야 할 일을 설명하기만 하면, Claude가 입력 내용을 바탕으로 이름, 설명, system prompt를 생성합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1773974844%2Fsubagentsvideo2version3_04.1773974843174.png)  

## 도구 커스터마이징

생성 과정에서 subagent가 접근할 수 있는 도구를 커스터마이징할 기회를 얻습니다. 도구 카테고리는 다음과 같습니다:

- Read-only tools (읽기 전용 도구)
- Edit tools (편집 도구)
- Execution tools (실행 도구)
- MCP tools
- Other tools (기타 도구)
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1773974881%2Fsubagentsvideo2version3_06.1773974881320.png)  

Subagent에게 실제로 필요한 것이 무엇인지 생각해봅시다. 코드 리뷰어에게는 아마 편집 도구가 필요 없을 것입니다. 코드를 읽고 분석해야 하지 변경할 필요는 없기 때문입니다. 다만 실행 도구는 활성화해두는 편이 좋을 수 있는데, 그래야 대기 중인 변경사항을 더 쉽게 식별할 수 있기 때문입니다.

## 모델과 색상 선택

도구 구성을 마친 뒤에는 subagent를 구동할 Claude 모델을 선택합니다. 옵션은 다음과 같습니다:

- **Haiku** -- 빠르고 가벼운 작업에 최적
- **Sonnet** -- 속도와 깊이의 균형이 좋은 중간 옵션
- **Opus** -- 복잡한 분석에 최적
- **Inherit** -- 메인 대화에서 사용 중인 모델을 그대로 사용

마지막으로 색상을 선택합니다. 색상은 UI에 표시되어 어떤 subagent가 활성화되어 있는지 빠르게 알아볼 수 있게 해줍니다. 사소한 부분이지만 여러 subagent를 동시에 실행할 때 유용합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1773974921%2Fsubagentsvideo2version3_07.1773974921584.png)  

## 설정 파일

생성이 완료되면 subagent 설정 파일이 프로젝트에 저장됩니다 (일반적으로 `.claude/agents/your-agent-name.md` 경로). 일반적인 subagent 설정 파일의 모습은 다음과 같습니다:

```js
---
name: code-quality-reviewer
description: Use this agent when you need to review recently written or modified code for quality, security, and best practice compliance.
tools: Bash, Glob, Grep, Read, WebFetch, WebSearch
model: sonnet
color: purple
---

You are an expert code reviewer specializing in quality assurance, security best practices, and
adherence to project standards. Your role is to thoroughly examine recently written or modified code
and identify issues that could impact reliability, security, maintainability, or performance.
```

각 필드를 살펴봅시다:

- **`name`** -- Subagent의 고유 식별자. Claude에게 직접 요청하거나 메시지에 `@agent code-quality-reviewer`라고 입력해서 이 이름으로 subagent를 참조합니다.
- **`description`** -- Claude가 subagent를 언제 사용할지 결정하는 데 영향을 줍니다. 반드시 한 줄이어야 하며, 줄바꿈이 필요하면 이스케이프된 개행 문자 `\n`을 사용하세요. 위임이 적절한 상황을 Claude가 이해하도록 돕기 위해 예시 대화를 포함할 수도 있습니다.
- **`tools`** -- Subagent가 접근할 수 있는 도구를 나열합니다. 생성 중에 선택한 항목과 일치하지만, 여기서 언제든 목록을 편집할 수 있습니다.
- **`model`** -- 사용할 Claude 모델을 지정합니다: `sonnet`, `opus`, `haiku`, 또는 `inherit`.
- **`color`** -- Subagent를 식별하기 위한 UI 색상.

## System Prompt

마크다운 파일의 본문(YAML frontmatter 아래의 모든 내용)이 system prompt입니다. 여기에 subagent에 대한 지시사항을 작성합니다. 무엇에 집중해야 하는지, 어떻게 분석해야 하는지, 메인 에이전트에게 발견 사항을 어떻게 보고해야 하는지를 적어 둡니다.

잘 작성된 system prompt는 유용한 subagent와 요점을 놓치는 subagent의 차이를 만듭니다. Subagent가 무엇을 살펴봐야 하는지, 출력을 어떻게 구조화해야 하는지를 구체적으로 적어주세요.

## Claude가 Subagent를 자동으로 사용하게 하기

사용자가 명시적으로 요청하지 않아도 Claude가 작업을 subagent에 위임하도록 만들고 싶다면, description 필드에 **"proactively"**라는 단어를 포함하세요. 예를 들면 다음과 같습니다:

```js
description: Proactively suggest running this agent after major code changes...
```

또한 description에 예시 대화를 추가하면, subagent를 사용해야 할 구체적인 시나리오를 Claude가 이해하는 데 도움이 됩니다. 예시가 구체적일수록 Claude는 언제 작업을 위임할지 더 잘 판단합니다.

## Subagent 테스트하기

Subagent를 만든 후에는 코드를 일부 변경하고 Claude에게 리뷰를 요청해서 테스트해봅시다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1773974991%2Fsubagentsvideo2version3_14.1773974991791.png)  

Subagent가 예상대로 사용되지 않는다면 description을 다시 확인해보세요. 더 구체적인 예시와 트리거 시나리오를 추가할수록 Claude가 subagent에게 언제 작업을 위임해야 할지 더 잘 이해합니다.
