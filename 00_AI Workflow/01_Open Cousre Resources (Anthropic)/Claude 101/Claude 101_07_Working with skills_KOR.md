---
title: "Working with skills"
source: "https://anthropic.skilljar.com/claude-101/383396"
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

  

**예상 시간:** 15분

### 학습 목표

- Skills (기술)가 무엇인지, Claude가 어떻게 사용하는지 설명하기
- 문서 생성을 위한 Anthropic의 내장 Skills 파악하기
- Settings에서 Skills 활성화 및 관리하기

---

### Skills란 무엇입니까?

Skills는 Claude가 특화된 작업에서 성능을 향상시키기 위해 동적으로 로드하는 지침, 스크립트, 리소스의 폴더입니다. 이들을 특정 작업을 완료하는 방법을 Claude에게 가르치는 전문 지식 패키지로 생각해보세요.

Excel 스프레드시트, PowerPoint 프레젠테이션, Word 문서, PDF를 생성하기 위해 Claude를 사용한 경우 이미 Skills를 작업 중으로 본 적이 있습니다. 이러한 파일 생성 기능은 백그라운드에서 실행되는 Skills로 구동됩니다. 하지만 Skills은 문서 생성을 훨씬 넘어갑니다. 사용자 정의 Skills은 전체 반복 워크플로우를 코드화할 수 있습니다. 예를 들어, 분기별 분산 분석 방법론, 브랜드 음성 검토 프로세스, 규정 준수 체크리스트가 있어서 Claude가 매번 동일한 엄격한 단계를 따릅니다.

### Skills의 유형

Skills에는 두 가지 범주가 있습니다:

- **Anthropic Skills**는 Anthropic에서 생성되고 유지됩니다. 이들은 Excel, Word, PowerPoint, PDF 파일에 대한 향상된 문서 생성 기능을 포함합니다. Anthropic Skills는 모든 유료 사용자에게 사용 가능하며 Claude는 관련될 때 자동으로 호출합니다. 특별한 작업을 수행할 필요가 없습니다.
- **사용자 정의 Skills**은 특화된 워크플로우 및 특정 영역 작업을 위해 당신 또는 조직이 만듭니다. 예를 들어, 프레젠테이션에 회사의 브랜드 지침을 적용하거나, 특정 형식으로 회의 메모를 구조화하거나, 조직의 데이터 분석 워크플로우를 실행하는 Skills을 생성할 수 있습니다.

### Skills 활성화하기

Skills은 현재 Pro, Max, Team, Enterprise 요금제의 사용자를 위한 기능 미리보기로 사용할 수 있습니다. Skills을 사용하려면 Code 실행 및 파일 생성을 활성화해야 합니다. Skills은 Claude의 보안 샌드박스 컴퓨팅 환경이 필요하기 때문입니다.

Skills을 활성화하는 방법은 다음과 같습니다:

1. **Settings > Capabilities**로 이동합니다.
2. **Code 실행 및 파일 생성**이 켜져 있는지 확인합니다.
3. **Skills** 섹션으로 스크롤합니다.
4. 필요에 따라 개별 Skills을 켜거나 끕니다.

**Enterprise 요금제**의 경우, 조직 소유자는 먼저 관리자 설정에서 Code 실행 및 Skills을 활성화해야 개별 구성원이 액세스할 수 있습니다.

**Team 요금제**의 경우, 이 기능 미리보기는 조직 수준에서 기본적으로 활성화됩니다.

활성화되면 설정에서 사용 가능한 Skills을 보게 되며, Anthropic의 내장 Skills 및 업로드한 사용자 정의 Skills을 포함합니다.

### 실전에서 Skills 사용하기

Skills의 아름다움은 일반적으로 이들에 대해 생각할 필요가 없다는 것입니다. Claude는 요청을 기반으로 Skill 선택을 자동으로 처리합니다. 다음은 Skills을 호출할 프롬프트의 예입니다:

- "월간 비용을 추적하는 Excel 스프레드시트를 총합 공식으로 생성하세요"
- "이 회의 메모 문서를 PowerPoint 프레젠테이션으로 전환하세요"
- "이 데이터를 요약하는 PDF 보고서를 생성하세요"
- "시나리오 분석이 있는 Excel의 재무 모델을 구축하세요"

Claude가 Skill을 사용할 때, 당신은 Claude의 생각의 사슬에서 언급된 것을 볼 수 있습니다. 결과는 컴퓨터에 저장하거나 Google Drive에 직접 저장할 수 있는 다운로드 가능한 파일입니다.

### 파일 실행

**슬라이드, 스프레드시트, 계약 수정안을 함께 작업합니다**

![](https://www.youtube.com/watch?v=LpGpwhORWr0)

이는 또한 Claude가 **당신의 실제 파일**과 (포함된 환경 내에서) 작업할 수 있다는 것을 의미합니다. 슬라이드, 스프레드시트, 계약을 업로드하고 Claude가 파일의 업데이트된 버전을 생성하는 것을 보세요 (참고: Chat에서 Claude는 원본을 제자리에 편집하지 않고 문서의 새 버전을 생성합니다). 슬라이드, 스프레드시트, 계약, (또는 any.xlsx, .pptx, .docx, .pdf 파일)을 업로드하고 Claude가 슬라이드를 생성하고, 분석을 수행하고, 제안한 수정안을 추가하는 것을 보세요. Claude가 완료되면 이러한 파일을 다운로드하거나 Drive에서 열 수 있습니다.

참고: 이 기능을 사용하려면 Claude에 외부 데이터 소스 액세스를 제공해야 합니다. 프롬프트될 때 "제한된 네트워크 액세스 허용"을 켜세요:

![](https://downloads.intercomcdn.com/i/o/lupk8zyo/1789944703/e9af099affd9b52e18cf9decd373/8ecc03cc-e50b-43b0-8694-c500638cb781?expires=1765910700&signature=09ecdf26fa5bf37cc61b9b9d921a5dc240d882f68a5cb008c2b306d67be06f3f&req=dScvH8B6mYZfWvMW1HO4zYwjyHsgM4gXNv1GpC923dkWEbTC23XmsD7tF%2FZ%2B%0AoqVGyu8SDXplXHIQX7g%3D%0A)

#### 보안 고려사항

Skills은 실행 가능한 코드를 포함할 수 있으므로 신중하게 사용해야 합니다:

- 신뢰할 수 있는 소스에서만 사용자 정의 Skills 설치하기
- Anthropic의 내장 Skills은 Anthropic에서 테스트하고 유지됩니다
- 업로드하는 사용자 정의 Skills은 개별 계정에 비공개입니다
- 외부 소스에서 사용자 정의 Skill을 설치하는 경우 사용하기 전에 내용을 검토하여 수행하는 작업을 이해합니다.

### 사용자 정의 Skills 생성하기

Anthropic의 내장 Skills은 일반적인 문서 생성 작업을 다루지만 Skills의 진정한 힘은 자신의 Skills을 만드는 데서 옵니다. 사용자 정의 Skills을 통해 Claude가 특정 워크플로우, 브랜드 지침, 업무 방식을 배울 수 있으므로 Claude는 관련될 때마다 해당 지식을 자동으로 적용할 수 있습니다.

Claude 자체와의 대화를 통해 사용자 정의 Skill을 만드는 가장 쉬운 방법입니다. 코드를 작성하거나 파일을 수동으로 생성할 필요가 없습니다. Claude가 기술 구조를 처리합니다.

다음은 대화를 통해 Skill을 생성하는 방법입니다:

1. **새 Chat을 시작**하고 Claude에게 생성하고 싶은 것을 말하세요. 예를 들어: "분기별 비즈니스 검토를 작성하는 Skill을 만들고 싶습니다" 또는 "프레젠테이션에 브랜드 지침을 적용하는 Skill이 필요합니다."
2. **Claude의 질문에 답하세요.** Claude는 워크플로우에 대해 질문하면서 당신과 인터뷰합니다: 이 Skill은 무엇을 수행해야 합니까? 이러한 유형의 작업에서 좋은 결과물은 무엇입니까? 이 Skill을 언제 사용할 수 있는 예시를 줄 수 있습니까?
3. **참조 자료 업로드하기** (있는 경우). 템플릿, 스타일 가이드, 브랜드 자산, 자랑스러워하는 업무의 예시는 모두 Claude가 찾고 있는 것을 정확하게 이해하는 데 도움이 됩니다.
4. **Skill 저장하기.** 완료되면 Claude가 제대로 구조화된 Skill을 포함한 파일을 생성합니다. 저장하기만 하면 Claude가 사용할 준비가 된 Skill이 됩니다.

**Skills 보기.** 왼쪽 사이드바에서 Customize 탭을 찾습니다. 거기서 사용 가능한 모든 Skills을 보고 사용자가 수동으로 또는 Claude와 Chat하여 수정한 Skills을 편집할 수 있습니다.

사용자 정의 Skill은 Anthropic의 내장 Skills 옆의 Skills 목록에 나타납니다. 이 시점부터 Claude는 관련 작업을 할 때마다 자동으로 호출합니다. 반복을 통해 Skills을 개선할 수 있습니다. Claude에 Skill을 편집하도록 요청하면 파일을 업데이트합니다.

### Skills 대 Project

Skills과 Project 모두 Claude에 더 많은 컨텍스트를 제공할 수 있다면 각각 언제 사용해야 할까요? 이렇게 생각해보세요: **Project는 지식을 저장하고, Skills은 작업을 수행합니다.**

**Project**는 지식 허브입니다. 당신의 업무를 이해하기 위해 Claude가 필요로 하는 참고 자료를 보유하고 있습니다. 프로젝트 사양, 회의 메모, 연구 문서입니다. Project에 파일을 업로드할 때 Claude는 해당 Project 내의 모든 대화에서 해당 정보를 끌어옵니다.

**Skills**는 절차적 기계입니다. 그들은 *어떻게* Claude가 작업을 실행해야 하는지 인코딩합니다. 구체적인 단계, 작업 순서, 매번 따르길 원하는 방법론입니다. Skills은 반복 워크플로우를 일관되게 실행하기를 원할 때 빛납니다.

두 기능은 서로를 보완합니다. Skill은 Project에 저장된 지식을 참조할 수 있습니다. 예를 들어, "고객 통화 준비" Skill은 고객 프로필로 업로드된 Project의 지식 기반을 가져올 수 있습니다. Project는 *what* (정보)를 제공하고, Skill은 *how* (프로세스)를 제공합니다.

|  | Project | Skill |
| --- | --- | --- |
| **목적** | Claude가 참조하는 지식을 저장 | Claude가 실행하는 프로세스를 정의 |
| **최고의 선택** | 장기적 컨텍스트, 참고 자료, 팀 협력 | 반복 워크플로우, 다중 단계 작업, 일관된 방법론 |
| **예시** | 고객 허브, 연구 친구, 피드백 생성기 | 프로세스 지침 (브랜드, 법률), 블로그 작성, PDF 생성 |
| **지속성** | Project 내의 모든 Chat에서 사용 가능한 지식 | Skill이 호출될 때 적용되는 지침 |

### 단원 성찰

계속 진행하기 전에 고려해보세요:

- 정기적으로 생성하는 문서 유형 중 Claude의 내장 Skills로부터 이점을 얻을 수 있는 것은 무엇입니까?
- 반복 워크플로우 중 사용자 정의 Skills의 좋은 후보가 될 것은 무엇입니까?
- Skills이 문서 생성 및 데이터 분석에 대해 생각하는 방식을 어떻게 변경할까요?

### 다음은 무엇인가요?

다음 단원 세트에서 Connector (커넥터)를 시작하여 Claude의 범위를 확장합니다. 이러한 강력한 도구는 정보 수집을 원활하게 하고 작업이 발생하는 도구에서 직접 Claude가 작업을 수행할 수 있게 합니다.

Skills에 대한 자세한 정보, 사용자 정의 Skills 만드는 방법을 포함하여 [Anthropic 도움말 센터](https://support.claude.com/en/articles/12512176-what-are-skills)를 방문하세요.

#### 피드백

과정을 진행하면서 과정의 개념을 업무에 어떻게 사용하고 있는지, 그리고 피드백이 있으신지 알려주고 싶으신 부분이 있으시면 [여기](https://forms.gle/sY9ou5fqZBd3TjHF8)에서 피드백을 공유해주세요.

#### 인정 및 라이선스

*Copyright 2025 Anthropic. All rights reserved.*
