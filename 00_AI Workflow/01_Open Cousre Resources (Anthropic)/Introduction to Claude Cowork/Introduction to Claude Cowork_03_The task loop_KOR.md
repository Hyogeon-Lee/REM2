---
title: "The task loop"
source: "https://anthropic.skilljar.com/introduction-to-claude-cowork/444166"
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

- 유용한 계획이 나올 만큼 명확하게 Cowork에 작업을 설명하기
- 작업 시작 전과 실행 중에 접근 방식을 조정하기
- 완성된 결과물을 올바른 검토 자세로 살피기

---

### 핵심 루프

![Your first task: the four-step loop](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1773281048%2Fslide-06-your-first-task.1773281048833.png)

개요

Claude는 계획을 제안한 뒤 행동에 옮기기 전에 사용자의 승인을 기다립니다. 필요하면 수정하고 승인하면 Claude가 실행에 들어가죠. 이것이 모든 Cowork 작업의 공통 패턴입니다.

#### 1\. 원하는 결과물을 설명하기

프롬프트는 Claude에게 **무엇을 살펴볼지**, **무엇을 받고 싶은지**, **결과물을 어디에 둘지**를 알려줄 때 잘 작동합니다. 완벽한 프롬프트를 만들 필요는 없습니다. 빠진 부분이 있으면 Claude가 후속 질문으로 채워 줍니다.

> "이번 주에 우리가 커버하는 회사 3곳이 실적을 발표했습니다. 컨퍼런스 콜 기록(transcripts)이 우리의 모델, 지난 분기 노트와 함께 폴더에 있습니다. 기록을 우리의 모델과 대조해 읽고, Slack의 #research-desk 채널에서 팀이 뭐라고 말했는지 확인한 뒤, 리서치 노트를 업데이트해 주세요. 우리의 가정(assumptions)을 바꾸는 부분이 있다면 표시(flag)해 주세요."

#### 2\. 몇 가지 질문에 답하기

Claude는 사용자의 프롬프트와 자신이 찾은 내용을 바탕으로, 결과물을 제대로 만들기 위한 몇 가지 질문을 던집니다. 어떤 접근을 취할지, 무엇을 우선할지, 완성된 결과물이 어떤 모습이어야 하는지 등이죠. Claude가 제시하는 보기 중 하나를 고르거나, 직접 답을 입력하면 됩니다.

#### 3\. 자리를 비우거나, 직접 개입하기

진행 상황 패널(progress panel)이 각 단계를 보여 줍니다. Claude가 어떤 파일을 읽고 있는지, 무엇을 만들고 있는지가 표시되죠. 큰 작업의 경우 Claude는 일을 여러 부분으로 나누어 동시에 처리합니다. 그대로 두고 다른 일을 하다 돌아와도 되고, 의도한 방향과 다르게 흘러가는 것 같으면 채팅에 입력해 방향을 바꿀 수도 있습니다.

#### 4\. 완성된 결과물 열기

결과물은 지정한 위치에 도착합니다. Claude가 읽은 파일들과 함께 같은 폴더에 저장되죠. 프롬프트에서 다른 위치를 요청했다면("Gmail에서 이메일 초안으로 작성" 또는 "공유 Drive 폴더에 저장" 등), 그쪽에 나타납니다.

결과물은 초안으로 다루세요. 유능한 동료가 처음 작성해 준 초안을 읽듯, 좋은 작업이지만 발송 전에 다듬어야 할 자신의 결과물이라는 자세로 검토하면 됩니다.

### 사용 경험을 좌우하는 몇 가지 사항

![Under the hood: how Cowork runs your tasks](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1773281049%2Fslide-07-under-the-hood.1773281049301.png)

개요

![During a task: what to expect](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1773281049%2Fslide-08-during-a-task.1773281049667.png)

개요

Cowork를 사용하기 위해 내부 동작 원리까지 알아야 할 필요는 없습니다. 다만 대략적인 그림을 알아 두면 더 나은 프롬프트를 작성하고, 어떤 작업이 Cowork에 잘 맞는지 가늠하는 데 도움이 됩니다.

- **Subagents (서브에이전트)** — 작업에 독립적인 부분이 있을 때, Cowork는 각각 고유한 임무와 새 컨텍스트(fresh context)를 가진 별도의 작업 흐름을 동시에 띄울 수 있습니다. 예를 들어 4개 공급업체를 비교한다면, 공급업체별로 서브에이전트를 하나씩 두고 각각 가격, 통합, 리뷰를 조사하게 할 수 있습니다. 이때 다른 공급업체의 자료가 시야를 흐리지 않습니다. 실제로 한 대화에 담기에는 너무 큰 작업도 각자 무리 없이 들어가는 단위로 쪼갤 수 있고, 각 부분이 집중된 주의를 받습니다. 즉 3번 공급업체에 대한 분석이 1번 공급업체의 세부 사항에 희석되지 않습니다.
- **Progress is visible (진행 상황 표시)** — 패널이 현재 활성 단계, 읽고 있는 파일, 만들고 있는 결과물을 보여 줍니다. 따라가도 되고 무시해도 됩니다.
- **You can steer while it runs (실행 중에도 방향 조정 가능)** — 의도와 다르게 흘러간다 싶으면 채팅에 입력해 방향을 바꾸세요. 작업이 끝날 때까지 기다릴 필요가 없습니다.
- **Isolated environment (격리된 환경)** — 코드 실행과 파일 생성은 컴퓨터 안의 격리된 환경에서 이루어집니다. 메인 시스템과 분리되어 있어, 접근을 허용하지 않은 영역은 건드리지 않습니다.
- **Deletion is gated (삭제는 별도 승인 필요)** — Cowork는 파일을 영구 삭제하기 전에 사용자에게 먼저 확인합니다. 승인하거나 거부할 수 있습니다.

### 따라 해보기: 어수선한 폴더가 완성된 데크로

루프가 실제로 어떻게 흘러가는지 보여 주는 예시입니다. 파일에서 출발해 완성된 결과물을 만들어 내는 작업이라면 어떤 경우에도 같은 형태가 됩니다.

#### 시작점

프로젝트 폴더에 흔히 쌓이는 자료들: 회의 노트, 체크리스트, 일정 스프레드시트, 저장된 이메일, 비교 매트릭스. 형식도 제각각이고, 정리도 느슨한 상태입니다.

목표: 이 자료들을 임원진에게 보여 줄 프레젠테이션으로 만들기.

#### 작업 설명하기

> "이 폴더의 모든 자료를 검토해서 도구 도입 검토(tooling review)에 대한 임원 보고용 프레젠테이션을 만들어 주세요. 공급업체 평가 결과, 일정, 비즈니스 케이스, 미해결 리스크(open risks)를 포함해 주세요. PowerPoint 파일로 출력해 주세요."

#### 계획 검토하기

Cowork가 자신의 계획을 보여 줍니다. 파일 읽기, 제안 종합, 비즈니스 케이스 구성, 데크 생성, 결과 검토 같은 단계가 나오죠. 추가하고 싶은 것이 있다면(예를 들어 PowerPoint와 함께 PDF도) 이 단계에서 말하면 됩니다.

#### 실행시키기

지켜보고 싶으면 보고, 그 사이 회의에 다녀와도 됩니다. 작업은 계속 진행됩니다.

#### 파일 열기

데크는 실제 PowerPoint 파일입니다. 차트는 클릭해서 데이터를 조정할 수 있는 편집 가능한 요소입니다. 처음부터 직접 조립할 때보다 완성에 훨씬 가까운 지점에서 시작하는, 다듬어 갈 수 있는 초안입니다.

### 작게 시작하기

경계가 분명한 작업부터 시작하세요. 폴더 정리, 문서 세트 종합 같은 것이 좋습니다. Cowork가 무엇을 잘 처리하는지에 대한 감을 익힌 뒤 점차 규모를 키워 나가세요.

### 실제로 해보기

단원 1에서 떠올렸던 작업을 사용해 보세요. Cowork를 해당 폴더로 지정하고, 원하는 결과물을 설명한 뒤, 루프를 한 번 끝까지 돌려 보세요.

### 다음은?

다음에는 매 세션마다 Cowork가 읽어 들이는 컨텍스트를 제공하는 방법을 배웁니다. 매번 같은 내용을 다시 설명하지 않아도 되도록 말이죠.

#### 피드백

[여기](https://forms.gle/sY9ou5fqZBd3TjHF8)에서 피드백을 공유해 주세요.

#### 감사의 말과 라이선스

*Copyright 2026 Anthropic. All rights reserved.*
