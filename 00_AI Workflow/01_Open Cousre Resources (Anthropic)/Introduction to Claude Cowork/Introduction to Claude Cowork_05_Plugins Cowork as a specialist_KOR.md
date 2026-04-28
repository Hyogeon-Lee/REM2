---
title: "Plugins: Cowork as a specialist"
source: "https://anthropic.skilljar.com/introduction-to-claude-cowork/444168"
author:
  - "[[the end of this lesson]]"
  - "[[you will be able to:]]"
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  

### ⁠

**예상 시간:** 15분

### 학습 목표

- 플러그인이 무엇인지, 그 안에 무엇이 있는지 설명하기
- 당신의 역할과 일치하는 플러그인 설치하기
- 스킬을 플러그인이 구축되는 구성 요소로 이해하기

---

### 플러그인이란?

![Plugins: turn Cowork into a specialist for your role](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1773939289%2Fslide-10-plugins.1773939289619.png)

개요

Plugins은 Cowork에 도메인 전문성을 제공합니다. 각각은 특정 기능을 위한 내장 지식과 워크플로우를 제공하므로 Claude는 전문가처럼 당신의 작업에 접근합니다.

플러그인은 번들입니다. 역할이나 도메인을 위해 함께 패키지된 여러 부분:

- **Skills (스킬)** — 특정 워크플로우를 처리하기 위한 지침. Claude는 자동으로 또는 프롬프트에서 `/`를 호출하여 그것을 그립니다. *예: 거래 요약을 구조화하는 방법, `/prep-call`, `/weekly-report`.*
- **Connectors (커넥터)** — 작업이 발생하는 시스템에 도달합니다. *예: 당신의 CRM, 당신의 문서, 당신의 메시징.*
- **Subagents (서브에이전트)** — 특화된 일을 병렬화합니다. *예: 책 전체 검토에서 계정당 하나의 에이전트.*

오픈 소스 플러그인은 대부분의 지식 업무 역할에 사용 가능합니다: 판매, 마케팅, 제품, 금융, 법률, 운영, 고객 지원, 데이터 등. 그들은 현 상태대로 작동하고 수정할 수 있습니다.

### 플러그인 설치하기

![Installing plugins: browse, install, customize](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1774046474%2Fslide-11-installing-plugins.1774046473979.png)

개요

1. **Browse (찾아보세요).** 플러그인은 Cowork의 **Customize** 영역에 있습니다. 당신이 하는 것과 일치하는 것을 찾으세요.
2. **Install (설치하세요).** 한 번 클릭. 플러그인은 즉시 활성화됩니다.
3. **Customize (사용자화하세요).** 설치되면, 플러그인은 컴퓨터의 폴더입니다. 그 안의 모든 것은 읽을 수 있고 편집 가능합니다.

### 안에 있는 것

플러그인은 단지 폴더입니다. 구조는 이런 모습입니다:

> ```js
> sales-plugin/
> ├── plugin.json         ← manifest: name, description, dependencies
> ├── skills/
> │   ├── deal-brief/     ← how to structure a deal brief
> │   ├── territory/      ← how to build a territory report
> │   └── prep-call/      ← /prep-call in the slash menu
> └── agents/
>     └── account-sweep.md ← subagent for per-account work
> ```

모든 파일은 평문입니다. 스킬이 어떻게 작동하는지 변경하려면, 그 파일을 열고 편집하세요. 새로운 스킬을 추가하려면, 스킬 아래에 폴더를 추가하세요. 빌드 단계가 없습니다. Cowork는 폴더를 직접 읽습니다.

### 스킬에 대하여

당신은 스킬이 자주 나타나는 것을 알아차릴 것입니다. 그들은 플러그인 내의 핵심 구성 요소입니다. 스킬은 마크다운 파일입니다. Claude에게 한 가지를 처리하는 방법을 가르칩니다: 워크플로우, 형식, 프로세스.

스킬은 Cowork만 해당되지 않습니다. 그들은 Claude의 표면 전체에서 작동합니다. Chat, Claude Code, Claude가 실행되는 어디서나. 플러그인은 Cowork 고유의 스킬을 일에 필요한 커넥터와 번들하는 방법입니다.

![](https://www.youtube.com/watch?v=bjdBVZa66oU)

스킬에 대해 더 깊이 알고 싶다면:

- [YouTube의 스킬 비디오 과정](https://www.youtube.com/playlist?list=PLmWCw1CzcFim_hkruZSlABOUOAAQ5JMyo) — 6부 연습
- [스킬이란?](https://support.claude.com/en/articles/12512176) — Help Center 참고
- [스킬을 사용하여 당신의 일하는 방식을 Claude에게 가르치세요](https://claude.com/resources/tutorials/teach-claude-your-way-of-working-using-skills) — 당신 자신의 프로세스를 인코딩하는 방법 튜토리얼
- [에이전트 스킬 소개](https://anthropic.skilljar.com/introduction-to-agent-skills) — 전체 과정

### 실제로 해보기

1. Cowork의 Customize 영역을 열고 플러그인을 찾아보세요.
2. 당신의 역할과 가장 가까운 플러그인을 설치하세요.
3. 설치된 플러그인 폴더를 찾아 스킬 파일 중 하나를 여세요. 그것이 읽을 수 있는 텍스트임을 보세요. 당신이 동료에게 브리핑하는 방식으로 작성되었습니다.

### 플러그인에 대해 자세히 알아보기

- [플러그인 디렉토리](https://claude.com/plugins) — 모든 플러그인을 찾아보세요. Anthropic과 커뮤니티 구축
- [Cowork에서 플러그인 사용하기](https://support.claude.com/en/articles/13837440-use-plugins-in-cowork) — 설치 및 설정을 위한 Help Center 가이드
- [Cowork에서 플러그인 사용자화하기](https://claude.com/resources/tutorials/how-to-customize-plugins-in-cowork)
- [처음부터 플러그인 구축하기](https://claude.com/resources/tutorials/how-to-build-a-plugin-from-scratch-in-cowork)
- [Cowork 플러그인 발표](https://claude.com/blog/cowork-plugins)
- [GitHub의 지식 업무 플러그인](https://github.com/anthropics/knowledge-work-plugins)
- [GitHub의 금융 서비스 플러그인](https://github.com/anthropics/financial-services-plugins)

### 다음은?

다음: 예약 작업. 당신이 잘 작동하는 작업을 가지면, 플러그인 스킬이든 당신이 쓴 프롬프트든, 당신은 매번 프롬프트하지 않고 일정에 따라 실행하도록 설정할 수 있습니다.

#### 피드백

[여기](https://forms.gle/sY9ou5fqZBd3TjHF8)에서 피드백을 공유하세요.

#### 감사의 말과 라이선스

*Copyright 2026 Anthropic. All rights reserved.*
