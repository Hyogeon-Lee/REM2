---
title: "Adding context"
source: "https://anthropic.skilljar.com/claude-code-in-action/303241"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## 컨텍스트 추가하기

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Claude와 코딩 프로젝트에서 작업할 때는 컨텍스트 관리가 중요합니다. 프로젝트에 수십 개 또는 수백 개의 파일이 있을 수 있지만, Claude는 효과적으로 도움을 주기 위해 올바른 정보만 필요합니다. 너무 많은 관련 없는 컨텍스트는 실제로 Claude의 성능을 저하시키므로, Claude를 관련 파일과 문서로 안내하는 방법을 배우는 것이 필수적입니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1750967940%2F004_-_Adding_Context_02.1750967940092.png)

## /init 명령

새 프로젝트에서 Claude를 처음 시작할 때 `/init` 명령을 실행합니다. 이것은 Claude에게 전체 코드베이스를 분석하고 다음을 이해하도록 지시합니다:

- 프로젝트의 목적 및 아키텍처
- 중요한 명령 및 중요한 파일
- 코딩 패턴 및 구조

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1750967941%2F004_-_Adding_Context_05.1750967940882.png)

코드를 분석한 후 Claude는 요약을 만들고 `CLAUDE.md` 파일에 작성합니다. Claude가 이 파일을 만들 수 있는 권한을 요청하면 Enter 키를 눌러 각 쓰기 작업을 승인하거나 Shift+Tab을 눌러 Claude가 세션 내내 파일을 자유롭게 쓰도록 할 수 있습니다.

## CLAUDE.md 파일

`CLAUDE.md` 파일은 두 가지 주요 목적을 제공합니다:

- Claude를 코드베이스를 통해 안내하고 중요한 명령, 아키텍처 및 코딩 스타일을 지적합니다
- Claude에게 구체적이거나 사용자 정의된 지침을 제공할 수 있도록 합니다

이 파일은 Claude에 대한 모든 요청에 포함되므로, 프로젝트에 대한 지속적인 시스템 프롬프트를 갖는 것과 같습니다.

## CLAUDE.md 파일 위치

Claude는 세 가지 일반적인 위치에 있는 세 가지 다른 `CLAUDE.md` 파일을 인식합니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1750967941%2F004_-_Adding_Context_09.1750967941793.png)

- **CLAUDE.md** - /init으로 생성, 소스 제어에 커밋, 다른 엔지니어와 공유
- **CLAUDE.local.md** - 다른 엔지니어와 공유하지 않음, Claude의 개인 지침 및 사용자 정의 포함
- **~/.claude/CLAUDE.md** - 컴퓨터의 모든 프로젝트와 함께 사용, 모든 프로젝트에서 Claude를 따르길 원하는 지침 포함

## 사용자 정의 지침 추가

`CLAUDE.md` 파일에 지침을 추가하여 Claude의 동작을 사용자 정의할 수 있습니다. 예를 들어, Claude가 코드에 너무 많은 주석을 추가하는 경우 파일을 업데이트하여 해결할 수 있습니다.

`#` 명령을 사용하여 "메모리 모드"에 들어갑니다. 이렇게 하면 `CLAUDE.md` 파일을 지능적으로 편집할 수 있습니다. 다음과 같이 입력하세요:

```js
# Use comments sparingly. Only comment complex code.
```

Claude는 이 지침을 `CLAUDE.md` 파일에 자동으로 병합합니다.

## '@'로 파일 언급

Claude가 특정 파일을 확인해야 할 때는 `@` 기호와 파일 경로를 사용합니다. 이렇게 하면 해당 파일의 내용이 Claude에 대한 요청에 자동으로 포함됩니다.

예를 들어 인증 시스템에 대해 물어보고 관련 파일을 알고 있다면 다음과 같이 입력할 수 있습니다:

```js
How does the auth system work? @auth
```

Claude는 인증 관련 파일 목록을 보여주고 선택한 파일을 대화에 포함시킵니다.

## CLAUDE.md에서 파일 참조하기

`CLAUDE.md` 파일에서 동일한 `@` 구문을 사용하여 파일을 직접 언급할 수 있습니다. 이는 프로젝트의 많은 측면과 관련된 파일에 특히 유용합니다.

예를 들어 데이터 구조를 정의하는 데이터베이스 스키마 파일이 있다면 `CLAUDE.md`에 다음을 추가할 수 있습니다:

```js
The database schema is defined in the @prisma/schema.prisma file. Reference it anytime you need to understand the structure of data stored in the database.
```

이렇게 파일을 언급하면 모든 요청에 해당 파일의 내용이 자동으로 포함되므로 Claude는 매번 스키마 파일을 검색하고 읽을 필요 없이 데이터 구조에 대한 질문에 바로 답변할 수 있습니다.
