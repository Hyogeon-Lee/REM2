---
title: "Configuration and multi-file skills"
source: "https://anthropic.skilljar.com/introduction-to-agent-skills/434526"
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

- *`allowed-tools`와 `model`을 포함한 고급 skill(스킬) 메타데이터 필드 구성하기*
- *올바른 요청에서 안정적으로 트리거되는 효과적인 skill 설명 작성하기*
- *`allowed-tools`를 사용하여 skill이 활성화되었을 때 Claude가 할 수 있는 일을 제한하기*
- *progressive disclosure(점진적 공개)와 multi-file(다중 파일) 구조를 사용하여 복잡한 skill 구성하기*

## 구성 및 다중 파일 skill

*(4분)*

![](https://www.youtube.com/watch?v=98KaK_rn5rQ)

이 비디오는 skill을 더욱 강력하게 만드는 고급 기법을 다룹니다: 전체 메타데이터 필드 세트, 안정적으로 트리거되는 설명을 작성하는 법, 보안에 민감한 워크플로우를 위해 도구 접근을 제한하는 법, 그리고 progressive disclosure(점진적 공개)를 사용해 더 큰 skill을 여러 파일에 걸쳐 구성하는 법입니다. 복잡한 사용 사례를 지원하면서도 skill을 효율적으로 유지하는 방법을 배웁니다.

#### 핵심 내용

- **`name`과 `description`은 필수**이며, `allowed-tools`와 `model`은 선택 사항이지만 강력한 추가 기능입니다
- 좋은 설명은 **두 가지 질문에 답합니다**: 이 skill은 무엇을 하나요? Claude는 언제 이를 사용해야 하나요?
- **`allowed-tools`**는 skill이 활성화되었을 때 Claude가 사용할 수 있는 도구를 제한합니다 — 읽기 전용 또는 보안에 민감한 워크플로우에 유용합니다
- **Progressive disclosure**: SKILL.md를 500줄 이하로 유지하고, 필요할 때만 Claude가 읽는 보조 파일(레퍼런스, 스크립트, 에셋)에 링크합니다
- **스크립트는 그 내용을 컨텍스트에 로드하지 않고 실행됩니다** — 출력만 토큰을 소비하므로 컨텍스트를 효율적으로 유지합니다

기본적인 skill은 이름과 설명만으로 작동하지만, Claude Code에서 skill을 훨씬 더 효과적으로 만들 수 있는 몇 가지 고급 기법이 있습니다. 주요 필드, 설명 작성 모범 사례, 도구 제한, 그리고 더 큰 skill을 구조화하는 방법을 살펴봅시다.

## Skill 메타데이터 필드

agent skills 오픈 표준은 SKILL.md frontmatter에서 여러 필드를 지원합니다. 두 개는 필수이고 나머지는 선택 사항입니다:

- **name** (필수) — Skill을 식별합니다. 소문자, 숫자, 하이픈만 사용하세요. 최대 64자. 디렉토리 이름과 일치해야 합니다.
- **description** (필수) — Claude에게 skill을 언제 사용할지 알려줍니다. 최대 1,024자. Claude가 매칭에 사용하므로 가장 중요한 필드입니다.
- **allowed-tools** (선택 사항) — Skill이 활성화되었을 때 Claude가 사용할 수 있는 도구를 제한합니다.
- **model** (선택 사항) — Skill에 사용할 Claude 모델을 지정합니다.

## 효과적인 설명 작성하기

지침은 명시적으로 작성하세요. 누군가가 당신에게 "당신의 일은 문서 작업을 돕는 것입니다"라고만 말한다면 무엇을 해야 할지 알 수 없을 것입니다 — Claude도 같은 방식으로 생각합니다.

좋은 설명은 두 가지 질문에 답합니다:

1. 이 skill은 무엇을 하나요?
2. Claude는 언제 이를 사용해야 하나요?

Skill이 예상한 시점에 트리거되지 않는다면, 사용자가 실제로 요청을 표현하는 방식과 일치하는 키워드를 더 추가해 보세요. 설명은 Claude가 skill의 관련성을 판단하는 데 사용되므로 표현이 중요합니다.

## allowed-tools를 사용하여 도구 제한하기

파일을 읽을 수만 있고 수정할 수는 없는 skill을 원할 때가 있습니다. 이는 보안에 민감한 워크플로우, 읽기 전용 작업, 또는 가드레일을 두고 싶은 모든 상황에 유용합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527264%2FSkills3_17.1771527264166.png)

이 예제에서 `allowed-tools` 필드는 `Read, Grep, Glob, Bash`로 설정됩니다. 이 skill이 활성화되면 Claude는 권한을 요청하지 않고 이러한 도구만 사용할 수 있습니다 — 편집이나 쓰기는 불가능합니다.

```js
---
name: codebase-onboarding
description: Helps new developers understand the system works.
allowed-tools: Read, Grep, Glob, Bash
model: sonnet
---
```

`allowed-tools`를 완전히 생략하면 skill(스킬)은 아무것도 제한하지 않습니다. Claude는 일반적인 권한 모델을 사용합니다.

## Progressive Disclosure(점진적 공개)

Skill(스킬)은 Claude의 context(컨텍스트) 윈도우를 대화와 공유합니다. Claude가 skill(스킬)을 활성화하면 그 SKILL.md의 내용이 context(컨텍스트)에 로드됩니다. 하지만 때로는 skill(스킬)이 의존하는 참고자료, 예제 또는 유틸리티 스크립트가 필요합니다.

모든 것을 2,000줄 파일에 집어넣으면 두 가지 문제가 있습니다: context(컨텍스트) 윈도우 공간을 많이 사용하고, 유지보수가 재미없습니다.

Progressive disclosure(점진적 공개)가 이를 해결합니다. SKILL.md에 필수 지침을 유지하고 필요할 때만 Claude가 읽는 별도의 파일에 상세한 참고자료를 넣으세요.

Open standard(개방 표준)는 skill(스킬) 디렉토리를 다음과 같이 정리할 것을 제안합니다:

- **scripts/** - 실행 가능한 코드
- **references/** - 추가 문서
- **assets/** - 이미지, 템플릿 또는 기타 데이터 파일

그리고 SKILL.md에서 언제 로드할지 명확한 지침과 함께 supporting file(지원 파일)에 링크하세요:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1771527265%2FSkills3_13.1771527265100.png)

이 예제에서 Claude는 누군가 시스템 설계에 대해 물어볼 때만 `architecture-guide.md`를 읽습니다. 컴포넌트를 어디에 추가할지 물어보면 그 파일을 절대 로드하지 않습니다. Context(컨텍스트) 윈도우에 전체 문서 대신 목차를 가지는 것과 같습니다.

좋은 경험칙: **SKILL.md를 500줄 이하로 유지하세요**. 그 이상이면 내용을 별도의 참고자료 파일로 나눌지 고려하세요.

## 스크립트를 효율적으로 사용하기

Skill(스킬) 디렉토리의 스크립트는 내용을 context(컨텍스트)에 로드하지 않고 실행될 수 있습니다. 스크립트가 실행되고 출력만 토큰을 소비합니다. SKILL.md에 포함할 핵심 지침은 스크립트를 *실행*하도록 Claude에게 지시하는 것입니다. *읽기*가 아니라요.

이는 특히 다음에 유용합니다:

- 환경 검증
- 일관성이 필요한 데이터 변환
- 생성된 코드보다 테스트된 코드로 더 안정적인 작업

## 수업 성찰

- 여러 파일을 포함하는 skill(스킬)을 만들고 싶다고 생각하는 것이 있나요? SKILL.md와 supporting reference file(지원 참고자료 파일)을 어떻게 구조화할까요?
- `allowed-tools`로 tool(도구) 접근을 제한하는 것이 팀의 워크플로우에 중요한 보안 계층을 추가할까요?

## 다음 단계

다음 수업에서는 skill(스킬)을 다른 Claude Code 커스터마이제이션 방법 - CLAUDE.md, subagent(서브에이전트), hook(훅), MCP 서버 - 과 비교하여 각 상황에 맞는 도구를 선택할 수 있도록 합시다.

#### 피드백

과정을 진행하면서 skill(스킬)을 어떻게 사용하고 있는지와 피드백이 있으면 알려주세요. [여기](https://forms.gle/RvHPBwQt9ZmcDc1P9)에서 피드백을 공유하세요.
