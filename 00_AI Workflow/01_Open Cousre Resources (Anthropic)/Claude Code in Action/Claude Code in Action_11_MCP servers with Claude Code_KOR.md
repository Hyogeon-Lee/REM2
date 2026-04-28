---
title: "MCP servers with Claude Code"
source: "https://anthropic.skilljar.com/claude-code-in-action/303239"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## Claude Code를 사용한 MCP 서버

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

MCP (Model Context Protocol) 서버를 추가하여 Claude Code의 기능을 확장할 수 있습니다. 이러한 서버는 컴퓨터에서 원격 또는 로컬로 실행되며 Claude에 일반적으로 갖지 못할 새로운 도구와 기능을 제공합니다.

가장 인기 있는 MCP 서버 중 하나는 Playwright로, Claude에 웹 브라우저를 제어할 수 있는 기능을 제공합니다. 이는 웹 개발 워크플로에 강력한 가능성을 열어줍니다.

## Playwright MCP 서버 설치

Claude Code에 Playwright 서버를 추가하려면 터미널에서 이 명령을 실행합니다(Claude Code 내부가 아님):

```js
claude mcp add playwright npx @playwright/mcp@latest
```

이 명령은 두 가지를 수행합니다:

- MCP 서버를 "playwright"로 명명합니다
- 컴퓨터에서 로컬로 서버를 시작하는 명령을 제공합니다

## 권한 관리

MCP 서버 도구를 처음 사용할 때 Claude는 매번 권한을 요청합니다. 이러한 권한 프롬프트에 지쳤으면 설정을 편집하여 서버를 미리 승인할 수 있습니다.

`.claude/settings.local.json` 파일을 열고 allow 배열에 서버를 추가합니다:

```js
{
  "permissions": {
    "allow": ["mcp__playwright"],
    "deny": []
  }
}
```

`mcp__playwright`의 이중 밑줄을 주목하세요. 이를 통해 Claude는 매번 권한을 요청하지 않고 Playwright 도구를 사용할 수 있습니다.

## 실제 예제: 구성 요소 생성 개선

다음은 Playwright MCP 서버가 개발 워크플로를 어떻게 개선할 수 있는지에 대한 실제 예입니다. 수동으로 테스트하고 프롬프트를 조정하는 대신 Claude가:

1. 브라우저를 열고 애플리케이션으로 이동합니다
2. 테스트 구성 요소를 생성합니다
3. 시각적 스타일 및 코드 품질을 분석합니다
4. 관찰한 내용을 기반으로 생성 프롬프트를 업데이트합니다
5. 개선된 프롬프트로 새 구성 요소를 테스트합니다

예를 들어 Claude에게 다음과 같이 요청할 수 있습니다:

> "localhost:3000으로 이동하여 기본 구성 요소를 생성하고 스타일을 검토한 후 @src/lib/prompts/generation.tsx에서 생성 프롬프트를 업데이트하여 앞으로 더 나은 구성 요소를 생성하도록 합니다."

Claude는 브라우저 도구를 사용하여 앱과 상호 작용하고, 생성된 출력을 살펴본 다음, 프롬프트 파일을 수정하여 더 독창적이고 창의적인 디자인을 장려합니다.

## 결과 및 이점

실제로 이 방식은 상당히 더 나은 결과를 도출할 수 있습니다. 일반적인 자주색에서 파란색으로의 그래디언트와 표준 Tailwind 패턴 대신 Claude는 프롬프트를 다음을 권장하도록 업데이트할 수 있습니다:

- 따뜻한 일몰 그래디언트(주황색에서 분홍색에서 자주색)
- 바다 깊이 테마(청록색에서 에메랄드에서 시안)
- 비대칭 디자인 및 겹치는 요소
- 창의적인 간격 및 독창적인(unconventional) 레이아웃

핵심 장점은 Claude가 코드뿐만 아니라 실제 시각적 출력을 볼 수 있다는 것입니다. 이를 통해 스타일 개선에 대해 훨씬 더 정보에 입각한 결정을 내릴 수 있습니다.

## 다른 MCP 서버 탐색

Playwright는 MCP 서버로 가능한 것의 한 가지 예일 뿐입니다. 생태계에는 다음을 위한 서버가 포함됩니다:

- 데이터베이스 상호 작용
- API 테스트 및 모니터링
- 파일 시스템 작업
- 클라우드 서비스 통합
- 개발 도구 자동화

특정 개발 요구에 맞는 MCP 서버를 탐색해 보세요. 이들은 Claude를 코드 어시스턴트에서 전체 도구 체인과 상호 작용할 수 있는 포괄적인 개발 파트너로 변환할 수 있습니다.
