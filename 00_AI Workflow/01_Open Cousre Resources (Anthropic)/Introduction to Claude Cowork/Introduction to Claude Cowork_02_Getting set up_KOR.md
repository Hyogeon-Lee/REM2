---
title: "Getting set up"
source: "https://anthropic.skilljar.com/introduction-to-claude-cowork/444165"
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

**예상 시간:** 7분

### 학습 목표

- Cowork에 접속하여 작업 폴더 지정하기
- 업무가 일어나는 도구와 페이지 연결하기
- 준비해 두어야 할 것 이해하기

---

### 필요한 것

![Cowork requirements: Desktop app, paid subscription, internet, keep app open](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1773281047%2Fslide-04-requirements.1773281047684.png)

개요

Cowork는 [Claude Desktop 앱](https://claude.com/download)에서 실행되며, 유료 Claude 요금제에서 사용할 수 있습니다. 현재 사용 가능 여부는 [요금제 상세 정보](https://claude.com/pricing)에서 확인할 수 있습니다.

### Cowork 열기

![Accessing Cowork: Open Desktop, switch to Cowork, describe your task](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1773281048%2Fslide-05-accessing-cowork.1773281048236.png)

개요

Claude Desktop을 엽니다. 앱 상단에는 Chat, Cowork, Code 사이를 전환할 수 있는 모드 선택기가 있습니다. **Cowork**를 클릭하세요.

Cowork가 옵션으로 보이지 않으면, 유료 요금제 사용 여부와 데스크톱 앱이 최신 버전인지 확인해 주세요.

### Claude에게 폴더 지정하기

이것이 채팅과의 핵심 차이입니다. Claude에게 작업 디렉터리를 지정해 주면, Claude가 거기에서 직접 파일을 읽고 만들고 편집합니다. 업로드도, 다운로드도 필요 없습니다.

**Work in a folder**를 클릭하고 컴퓨터에서 디렉터리를 선택하세요. Claude는 그 안의 모든 파일(PDF, 스프레드시트, Word 문서 등 무엇이든)을 읽고 완성된 작업을 같은 위치에 저장합니다. 파일을 변경하기 전에는 권한을 요청합니다.

이후에 다시 이어서 할 작업이라면, 프로젝트(project)가 해당 폴더를 지침(instructions)과 메모리(memory)로 감싸서 모든 세션에 걸쳐 컨텍스트를 유지해 줍니다. 이는 단원 4의 주제입니다.

### 도구 연결하기

Connectors는 Cowork를 업무가 일어나는 서비스(Slack, Google Drive, Gmail, Calendar 등)에 연결합니다. 한 번 설정해 두면 이후 모든 작업이 이를 활용할 수 있습니다.

목록은 Cowork의 **Customize** 영역에서 확인할 수 있습니다. 사용하는 도구를 켜 두세요. 연결된 후에는 프롬프트에서 자연스럽게 참조할 수 있습니다. 예를 들어 스레드를 복사해 붙여넣는 대신 "이 건에 대해 팀이 Slack에서 뭐라고 말했는지 확인해 줘"처럼 요청하면 됩니다. Claude는 연결된 도구 안에서 작업도 할 수 있어, Gmail에서 이메일 초안을 작성하거나 Drive에 파일을 저장할 수도 있습니다.

### Claude in Chrome 추가하기

업무 중 일부는 connector가 없는 페이지에서 이루어집니다. 사내 대시보드, 협력사 포털, 로그인 뒤에 있는 웹 앱 등이죠. Cowork가 이런 페이지에 접근하는 수단이 [Claude in Chrome](https://claude.com/claude-for-chrome)입니다. 동일한 Customize 영역에서 설치한 뒤 사이트별로 권한을 부여하면, Cowork가 작업의 일환으로 페이지를 열고, 콘텐츠를 읽고, 상호작용할 수 있게 됩니다.

이 확장 프로그램은 단독으로는 현재 탭을 읽어 주는 사이드바 어시스턴트입니다. 자동화는 Cowork가 이를 구동할 때 일어납니다. 사용 흐름을 살펴보려면 [Chrome 튜토리얼](https://claude.com/resources/tutorials/simplify-your-browsing-experience-with-claude-for-chrome)을 참고하고, 확장 프로그램이 로컬 파일과 함께 작동하는 사례는 [브라우저 차트와 폴더 데이터로 분석 구축하기](https://claude.com/resources/use-cases/build-analysis-from-browser-charts-and-folder-data)에서 볼 수 있습니다.

시작하기에는 폴더 하나만 있어도 충분합니다. Connectors와 Chrome 확장 프로그램은 필요해질 때 사용하면 되고, Plugins와 예약 작업(scheduled tasks)은 이후 단원에서 다룹니다.

### 실제로 해보기

Claude Desktop을 열고 Cowork로 전환한 뒤, 함께 작업하고 싶은 폴더를 지정해 보세요. 다음 단원에서 첫 작업을 실행하게 됩니다.

### 다음은?

다음에는 핵심 루프(core loop)를 살펴봅니다. 원하는 작업을 설명하고, 후속 질문에 답하고, Claude가 작업하도록 두었다가, 완성된 파일을 여는 흐름이죠.

자세한 설정 도움말은 Help Center의 [Cowork 시작하기](https://support.claude.com/en/articles/13345190)를 참고하세요. 팀 및 엔터프라이즈 관리자라면 [Cowork for Team/Enterprise](https://support.claude.com/en/articles/13455879)도 함께 살펴보는 것이 좋습니다.

#### 피드백

[여기](https://forms.gle/sY9ou5fqZBd3TjHF8)에서 피드백을 공유해 주세요.

#### 감사의 말과 라이선스

*Copyright 2026 Anthropic. All rights reserved.*
