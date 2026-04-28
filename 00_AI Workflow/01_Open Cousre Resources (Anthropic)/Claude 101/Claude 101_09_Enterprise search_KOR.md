---
title: "Enterprise search"
source: "https://anthropic.skilljar.com/claude-101/383398"
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

  

## Enterprise 검색

**예상 시간:** 15분

### 학습 목표

- Enterprise 검색이 무엇인지, 그리고 Enterprise 검색이 답할 수 있는 질문의 유형을 설명하기
- Admin과 사용자 모두에 대한 설정 프로세스 이해하기
- 보안 및 권한이 조직 데이터를 보호하는 방법 인식하기

---

### Enterprise 검색이란 무엇입니까?

Enterprise 검색은 "Ask {Your Org Name}" 옵션을 사이드바에 추가합니다. 이는 회사의 도구 및 데이터 소스 전반에 분산된 지식을 찾고 종합하기 위해 특별히 설계되었습니다. Enterprise 검색을 전체 조직을 위한 사전 구축된 Project로 생각해보세요. 회사의 지식 기반이 이미 로드되었으므로 즉시 시작하여 컨텍스트에 맞는 답변을 받을 수 있습니다.

Connector가 활성화된 일반 Chat과 달리 Enterprise 검색은 정보 수집을 위해 특별히 설계되었으며, Anthropic 팀이 구성한 사용자 정의 지침을 사용합니다.

### 무엇을 물어볼 수 있습니까?

Enterprise 검색은 여러 소스에 걸쳐 있거나 조직 전체에서 정보를 종합해야 하는 질문에 특히 가치 있습니다. 다음은 일반적인 사용 사례입니다:

**속도 높이기**

- "내가 나가 있는 동안 어제 일어난 일은 무엇입니까?"
- "지난 주 전체 비즈니스의 주요 업데이트를 요약하세요"
- "Platform 프로젝트에서 현재 차단자는 무엇입니까?"

**정책 및 프로세스 질문**

- "회사의 원격 근무 정책이 무엇입니까?"
- "경비를 보고하려면 어떻게 합니까?"
- "휴가 요청을 위한 프로세스는 무엇입니까?"

**연구 및 분석**

- "고객이 경쟁자를 선택하는 주된 이유는 무엇입니까?"
- "Q4 제품 로드맵에 대해 논의한 것을 요약하세요"
- "고객 온보딩 프로세스에 대한 정보를 찾으세요"

**새 팀원 온보딩**

- "우리 인증 시스템은 어떻게 작동합니까?"
- "청구 시스템을 배우기 위해 누구와 이야기해야 합니까?"
- "엔지니어 팀이 배포에 어떤 도구를 사용합니까?"

**성능 및 Project 추적**

- "마케팅 캠페인과 관련된 논의 및 문서를 찾으세요"
- "지난주 리더십 회의에서 주요 결정이 무엇이었습니까?"
- "Infrastructure 이니셔티브에 대한 팀 기여도를 요약하세요"

질문을 하면 Claude는 SharePoint 문서, Slack 대화, Gmail 스레드, Google Drive 파일과 같은 모든 연결된 도구에서 검색하고 정보를 통합 응답으로 종합합니다. 또한 항상 소스를 인용하여 전체 컨텍스트를 얻기 위해 돌아갈 수 있습니다.

### Enterprise 검색 설정하기

Enterprise 검색은 **두 단계 설정 프로세스**가 필요합니다: 먼저 Admin이 조직을 위해 구성하고, 그 다음 개별 사용자가 개인 계정으로 인증합니다.

#### Admin의 경우 (소유자)

Enterprise 검색 Project는 기본적으로 모든 Team 및 Enterprise 조직에 대해 활성화되어 있지만, 팀원이 사용하기 전에 Owner가 초기 설정을 완료해야 합니다:

1. 왼쪽 사이드바에서 "Ask Your Org"를 클릭합니다.
2. "조직을 위해 설정"을 클릭하여 계속하거나 (기능을 끄려면 "Disable") 계속합니다.
3. 조직의 도구를 연결합니다. **문서** (Google Drive 또는 SharePoint와 같은)와 **Chat** (Slack 또는 Microsoft Teams와 같은)에 대해 Connector를 선택해야 합니다. 이메일을 권장하지만 선택 사항입니다.
4. "+ 더 추가"를 클릭하여 팀이 필요로 하는 추가 도구를 설정합니다.
5. Project 이름을 사용자 정의합니다. 입력한 모든 것이 모든 사람의 사이드바에 "Ask [Name]"으로 나타납니다.
6. 설명을 추가한 후 "설정 완료"를 클릭합니다.

설정이 완료되면 Project는 조직의 모든 구성원이 사용할 수 있게 됩니다.

#### 사용자의 경우

Admin이 Enterprise 검색을 설정한 후 "{Org Name}" Project를 사이드바에 별표로 표시하여 볼 수 있습니다. 시작하는 방법은 다음과 같습니다:

1. 사이드바의 Project를 클릭합니다.
2. 안내 온보딩 흐름을 따라 권장 서비스에 연결합니다.
3. 검색하고 싶은 각 서비스 (Slack, Google, Microsoft 365 등)로 인증합니다.
4. Claude에 조직의 지식에 대해 질문하기 시작합니다.

더 많은 Connector를 활성화할수록 검색 결과가 더 포괄적입니다. 나중에 Project의 지침 섹션에서 "연결"을 클릭하여 언제든 더 많은 Connector를 추가할 수 있습니다.

### 많은 데이터가 있다... 이것이 안전합니까?

간단히 말해 네, 그렇습니다. Enterprise 검색은 연결된 원본 도구에서 이미 액세스할 수 있는 것만 표시합니다. 또한 대화는 비공개로 유지되며, 연결된 데이터는 별도로 인덱싱되거나 저장되지 않습니다.

### 단원 성찰

계속 진행하기 전에 고려해보세요:

- 조직의 문서 및 커뮤니케이션을 검색하여 답할 수 있는 질문은 동료에게 정기적으로 물어보는 것이 무엇입니까?
- Enterprise 검색이 새 팀원이 더 빠르게 속도를 높이는 데 도움이 될 수 있는 온보딩이나 교육 시나리오가 있습니까?
- 특정 역할을 위해 어떤 데이터 소스가 연결하는 것이 가장 가치가 있을까요?

### 다음은 무엇인가요?

다음 단원에서는 Research mode에 대해 배웁니다. 빠른 조회를 넘어 포괄적인 분석을 위한 Claude의 기능입니다.

Enterprise 검색에 대한 자세한 정보는 [Anthropic 도움말 센터](https://support.claude.com/en/articles/12489464-using-enterprise-search)를 방문하세요.

#### 피드백

과정을 진행하면서 과정의 개념을 업무에 어떻게 사용하고 있는지, 그리고 피드백이 있으신지 알려주고 싶으신 부분이 있으시면 [여기](https://forms.gle/sY9ou5fqZBd3TjHF8)에서 피드백을 공유해주세요.

#### 인정 및 라이선스

*Copyright 2025 Anthropic. All rights reserved.*
