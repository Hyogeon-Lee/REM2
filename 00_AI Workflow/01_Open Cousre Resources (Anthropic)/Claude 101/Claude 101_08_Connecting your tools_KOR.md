---
title: "Connecting your tools"
source: "https://anthropic.skilljar.com/claude-101/383397"
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

  

**예상 시간:** 20분

### 학습 목표

- Connector (커넥터)가 무엇이고 Claude와 함께 작업하는 것이 왜 중요한지 설명하기
- Connector 디렉터리를 탐색하고 첫 번째 연결 설정하기
- 대화에서 연결된 도구를 효과적으로 사용하기

---

### 동영상

![](https://www.youtube.com/watch?v=_jjSS0qGFbI)

#### 주요 내용

- **Connector는 Claude를 어시스턴트에서 정보가 풍부한 협력자로 변환합니다.** Claude는 매일 사용하는 동일한 도구, 데이터, 컨텍스트에 액세스할 수 있게 합니다. Claude가 매번 처음부터 시작하는 대신 실제 정보로 직접 작업할 수 있습니다.
- **Connector는 Claude가 정보를 읽고 당신을 대신하여 작업을 수행하도록 허용합니다.** Connector와 부여하는 권한에 따라 Claude는 파일을 검색하고, 문서를 검색하고, 데이터를 분석하고, 새 콘텐츠를 생성하고, 기록을 업데이트하고, 대화 내에서 연결된 애플리케이션 전체의 작업을 실행할 수 있습니다.
- **Model Context Protocol (MCP)가 Connector를 구동합니다.** MCP를 AI를 위한 USB-C처럼 생각해보세요. 단일 일관된 인터페이스를 통해 Claude가 많은 다양한 애플리케이션에 연결할 수 있는 보편적 표준입니다. 이 오픈 표준은 개발자가 모든 도구를 위한 Connector를 구축할 수 있으며, 이러한 Connector는 Claude와 원활하게 작동합니다.
- **Connector의 두 가지 유형이 있습니다: 웹 Connector와 데스크톱 확장입니다.** 웹 Connector는 Google Drive, Notion, Slack, Asana와 같은 클라우드 서비스에 Claude를 연결합니다. 데스크톱 확장은 Claude 데스크톱 앱을 통해 로컬로 실행되어 Claude가 로컬 파일 및 기본 애플리케이션에 액세스할 수 있게 합니다.

### 도구 찾기 및 연결하기

Anthropic은 claude.ai/directory에서 권장 Connector의 디렉터리를 유지합니다. 디렉터리는 두 탭으로 구성되어 있습니다:

- **웹:** 클라우드 서비스 및 애플리케이션 (Gmail, Notion, Slack, Asana, Linear, Stripe 및 많은 다른 것들)
- **데스크톱 확장:** Claude 데스크톱 앱을 통해 컴퓨터에서 실행되는 로컬 도구

사용 가능한 Connector를 탐색하려면 Chat 윈도우의 왼쪽 아래에서 "도구 검색 및 추가" 버튼을 클릭한 후 "Connector 추가"를 선택합니다.

#### 웹 Connector 설정하기

다음은 클라우드 서비스를 연결하는 방법입니다:

1. **Connector 찾기:** claude.ai/directory로 이동하거나 모든 Chat에서 "도구 검색" > "Connector 추가"를 클릭합니다.
2. **연결 클릭:** 추가하고 싶은 Connector를 선택합니다.
3. **인증:** 서비스의 로그인 페이지로 리디렉션됩니다. 기존 자격 증명으로 로그인합니다.
4. **권한 부여:** Claude가 요청하는 특정 권한을 검토한 후 액세스를 승인합니다.
5. **연결 테스트:** Claude로 돌아와서 "[도구명]에 액세스할 수 있습니까?"와 같은 간단한 요청을 시도하세요.

연결되면 Claude는 해당 서비스 내에서 검색, 읽기, 경우에 따라 작업을 수행할 수 있습니다 (부여한 권한에 따라).

#### 데스크톱 확장

데스크톱 확장은 웹 인터페이스 대신 Claude 데스크톱 앱이 필요합니다. 이러한 확장은 Claude가 로컬 애플리케이션, 파일 시스템, macOS 또는 Windows의 기본 기능과 상호 작용할 수 있게 합니다.

일부 데스크톱 확장은 다음을 포함합니다:

- 문서 읽기 및 구성을 위한 로컬 파일 액세스
- 자동화된 웹 작업을 위한 브라우저 제어
- 네이티브 애플리케이션 통합 (예: 설계 작업을 위한 Figma)

데스크톱 확장을 설치하려면:

1. [Claude 데스크톱 앱](https://claude.ai/download)을 다운로드하고 설치합니다.
2. 앱을 열고 Settings > Extensions로 이동합니다.
3. 사용 가능한 확장을 탐색하고 설치를 클릭합니다.
4. 해당 확장과 관련된 추가 설정 단계를 따릅니다.

### 업무에서 Connector 사용하기

도구를 연결하면 Claude는 요청에 응할 때 이들을 고려합니다.

![](https://www.youtube.com/watch?v=QTfoYDzqXn0)

다음은 연결된 도구를 사용하는 실용적인 방법입니다:

**프로젝트 관리 (Asana, Linear, Jira)**

- "이번 주 기한인 최우선 작업은 무엇입니까?"
- "Q4 예산 제안 검토를 위한 새 작업을 생성하세요"
- "우리 제품 출시 프로젝트의 상태를 요약하세요"

**커뮤니케이션 (Slack, Gmail)**

- "판매자 계약에 대해 논의한 이메일 스레드를 찾으세요"
- "#마케팅 채널의 최신 메시지에 대한 회신 초안을 작성하세요"
- "팀이 어제의 논의에서 타임라인에 대해 어떤 결정을 내렸습니까?"

**문서 (Notion, Google Drive, Confluence)**

- "우리 브랜드 음성 지침을 위해 문서를 검색하세요"
- "지난주 제품 검토 회의 메모를 요약하세요"
- "우리 스타일 가이드가 축약형 사용에 대해 무엇을 말합니까?"

**비즈니스 도구 (Stripe, PayPal, Salesforce)**

- "지난 분기의 수익 트렌드를 보여주세요"
- "Acme Corp 기회의 상태는 무엇입니까?"
- "최근 거래 중 1,000달러 이상을 나열하세요"

### 보안 및 권한

Claude를 외부 서비스에 연결할 때 이러한 서비스 내의 데이터를 읽고 때로는 수정할 수 있는 권한을 부여합니다. 다음은 중요한 고려사항입니다:

- **범위 액세스:** 권한은 Connector가 필요한 것에 관련되며 각 애플리케이션의 메뉴 내에서 개별 권한을 켜고 끌 수 있습니다.
- **Claude는 당신이 보는 것을 봅니다:** Claude는 *당신이* 원본 도구에서 액세스할 수 있는 데이터만 액세스할 수 있습니다. 직장 이메일을 연결해도 Claude는 최고경영자의 받은 편지함에 액세스할 수 없습니다. 자신의 것만 가능합니다.
- **언제든 취소 가능:** Claude 설정을 통해 또는 제3자 서비스의 보안 설정을 통해 서비스를 연결 해제할 수 있습니다. Skills와 마찬가지로, 사용자 정의 Connector를 찾거나 구축할 수도 있습니다. 신뢰할 수 있는 소스에서만 Connector를 설치하세요.

### 단원 성찰

계속 진행하기 전에 고려해보세요:

- 일일 업무 도구 중 Claude에 연결하면 가장 가치 있는 것은 무엇입니까?
- 어떤 작업이 현재 복사 및 붙여넣기 정보를 필요로 하는데 Connector가 자동으로 처리할 수 있을까요?
- 여러 연결된 소스의 데이터를 결합하는 것이 상당한 시간을 절약할 수 있는 워크플로우가 있습니까?

### 다음은 무엇인가요?

다음 단원에서는 Enterprise Search에 대해 배웁니다. Claude for Work 사용자를 위한 특화된 기능으로 사용자 정의 프롬프트가 회사의 컨텍스트에 최적화된 조직의 지식 소스에 Claude를 연결합니다.

Connector 및 Model Context Protocol에 대한 자세한 정보는 [Anthropic 도움말 센터](https://support.anthropic.com/en/articles/11176164-pre-built-web-connectors-using-remote-mcp)를 방문하거나 claude.ai/directory에서 Connector 디렉터리를 살펴보세요.

#### 피드백

과정을 진행하면서 과정의 개념을 업무에 어떻게 사용하고 있는지, 그리고 피드백이 있으신지 알려주고 싶으신 부분이 있으시면 [여기](https://forms.gle/sY9ou5fqZBd3TjHF8)에서 피드백을 공유해주세요.

#### 인정 및 라이선스

*Copyright 2025 Anthropic. All rights reserved.*
