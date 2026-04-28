---
title: "Designing effective subagents"
source: "https://anthropic.skilljar.com/introduction-to-subagents/450700"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
이제 subagent를 만드는 방법을 알았으니, 실제로 효과적으로 만드는 패턴을 살펴봅시다. 잘못 구성된 subagent는 방향을 잃거나 너무 오래 실행되거나 메인 에이전트가 사용할 수 없는 결과물을 내놓습니다. 해결책은 네 가지로 귀결됩니다: 좋은 description 작성, 출력 형식 정의, 장애물 보고, 도구 접근 제한입니다.

## Subagent 설정 데이터의 사용 방식

메인 컨텍스트 윈도우 에이전트에 메시지를 보낼 때, 사용 가능한 모든 subagent의 이름(name)과 설명(description)이 system prompt에 포함됩니다. 이것이 메인 에이전트가 어떤 subagent를 언제 띄울지 결정하는 방식입니다. Subagent가 자동으로 트리거되는 시점을 더 잘 제어하고 싶다면, 바로 이 이름과 설명을 조정해야 합니다.

설명은 두 번째 역할도 합니다. 메인 에이전트는 subagent를 띄울 때 작업을 개시할 입력 프롬프트(input prompt)를 작성하는데, 이 프롬프트를 작성할 때 설명을 가이드로 사용합니다. 따라서 설명은 subagent가 *언제* 실행되는지뿐만 아니라 *어떤 지시를 받는지*까지 결정합니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1773975083%2Fvid3redone-v2_02.1773975083694.png)  

## 입력 프롬프트를 좌우하는 설명 작성하기

코드 리뷰 subagent를 생각해봅시다. 일반적인 description만 있을 때, 메인 에이전트는 "use get diff to find the current changes"와 같은 모호한 입력 프롬프트를 작성할 수 있습니다. 그러면 subagent는 어떤 파일이 중요한지 스스로 알아내야 합니다.

description을 "You must tell the agent precisely which files you want it to review"와 같이 업데이트하면, 메인 에이전트는 이제 리뷰해야 할 실제 파일을 명시한 훨씬 더 구체적인 입력 프롬프트를 작성하게 됩니다.

이 기법은 다양한 유형의 subagent에 동일하게 적용됩니다. 예를 들어 웹 검색 subagent의 description에 "return sources that can be cited"를 추가하면, 메인 에이전트가 작업을 위임할 때 그 지시사항을 함께 포함하게 됩니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1773975124%2Fvid3redone-v2_03.1773975124367.png)  

## 출력 형식 정의하기

Subagent에 가할 수 있는 가장 중요한 개선은 system prompt에 출력 형식(output format)을 정의하는 것입니다. 이렇게 하면 두 가지 효과가 있습니다:

- 자연스러운 종료 지점이 생깁니다. Subagent는 형식의 각 섹션을 다 채우면 작업이 끝났음을 압니다.
- Subagent가 너무 오래 실행되는 것을 방지합니다. 정의된 출력이 없으면 subagent는 조사가 충분히 이루어졌는지 판단하기 어려워하며, 필요한 것보다 훨씬 오래 실행되는 경향이 있습니다.

다음은 코드 리뷰 subagent를 위한 구조화된 출력 형식의 예시입니다:

```js
Provide your review in a structured format:

1. Summary: Brief overview of what you reviewed and overall assessment
2. Critical Issues: Any security vulnerabilities, data integrity risks,
   or logic errors that must be fixed immediately
3. Major Issues: Quality problems, architecture misalignment, or
   significant performance concerns
4. Minor Issues: Style inconsistencies, documentation gaps, or
   minor optimizations
5. Recommendations: Suggestions for improvement, refactoring
   opportunities, or best practices to apply
6. Approval Status: Clear statement of whether the code is ready
   to merge/deploy or requires changes
```

이 형식은 subagent에게 따라야 할 명확한 체크리스트를 제공합니다. 모든 섹션이 채워지면 subagent는 작업을 멈춰도 된다는 것을 압니다.

## 장애물 보고하기

Subagent가 작업 중에 우회책(workaround)을 발견했을 때 -- 예를 들어 의존성 문제를 해결하거나 특정 명령어에 특정 플래그가 필요하다는 것을 알아냈을 때 -- 이런 세부 사항은 subagent가 반환하는 요약에 반드시 포함되어야 합니다. 그렇지 않으면 메인 스레드가 같은 해결책을 다시 찾아내야 하므로 시간과 토큰이 낭비됩니다.

밖으로 드러나야 할 정보의 종류는 다음과 같습니다:

- 설정 문제 또는 환경 관련 특이 사항
- 작업 중에 발견된 우회책
- 특정 플래그나 설정이 필요했던 명령어
- 문제를 일으킨 의존성이나 import

이런 정보를 얻으려면 출력 형식에서 명시적으로 요구해야 합니다. 출력 템플릿에 "Obstacles Encountered" 섹션을 추가하면 이 정보가 안정적으로 드러납니다.

```js
7. Obstacles Encountered: Report any obstacles encountered during the
   review process. This can be: setup issues, workarounds discovered or
   environment quirks. Report commands that needed a special flag or
   configuration. Report dependencies or imports that caused problems.
```
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1773975160%2Fvid3redone-v2_11.1773975160096.png)  

## 도구 접근 제한하기

모든 subagent가 모든 도구에 접근해야 할 필요는 없습니다. Subagent가 실제로 무엇을 해야 하는지 생각해보고, 그 일에 필요한 도구만 부여하세요. 이렇게 하면 두 가지 효과가 있습니다. 의도하지 않은 부작용을 방지하고, 여러 subagent를 운용할 때 각 subagent의 역할이 더 명확해집니다.

일반적인 subagent 유형별로 도구 접근을 어떻게 생각하면 좋은지 살펴봅시다:

- **Research / read-only subagent** -- `Glob`, `Grep`, `Read`만 있으면 됩니다. 파일을 실수로 수정할 수 없습니다.
- **Code reviewer** -- 변경사항을 확인하려면 `git diff`를 실행할 `Bash` 접근이 필요하지만, `Edit`이나 `Write`는 여전히 필요 없습니다.
- **Styling / code modification agent** -- 이 유형에서는 `Edit`과 `Write` 접근을 부여합니다. Subagent의 임무 자체가 실제로 코드를 변경하는 것이기 때문입니다.

## 종합하기

효과적인 subagent는 다음 네 가지 특성을 공유합니다:

1. **구체적인 description** -- description은 subagent가 언제 띄워지는지와 어떤 지시를 받는지를 모두 좌우합니다. 두 측면을 모두 의도한 방향으로 이끌도록 작성하세요.
2. **구조화된 출력** -- system prompt에 출력 형식을 정의하여 subagent가 언제 작업을 마쳐야 할지 알게 하고, 메인 스레드가 활용할 수 있는 정보를 반환하도록 하세요.
3. **장애물 보고** -- 출력 형식에 우회책, 특이 사항, 문제를 담을 섹션을 포함시켜, 메인 스레드가 같은 내용을 다시 발견하지 않도록 하세요.
4. **제한된 도구 접근** -- Subagent에는 실제로 필요한 도구만 부여하세요. 조사용은 read-only, 리뷰어는 Bash, 코드를 변경해야 하는 에이전트에만 Edit/Write를 줍니다.

각 패턴은 그 자체로는 단순하지만, 함께 적용하면 subagent를 막연하게 도움을 주려 시도하는 존재에서, 정해진 시간 안에 작업을 마치고 결과를 명확하게 보고하는 초점 잡힌 예측 가능한 작업자로 탈바꿈시킵니다.
