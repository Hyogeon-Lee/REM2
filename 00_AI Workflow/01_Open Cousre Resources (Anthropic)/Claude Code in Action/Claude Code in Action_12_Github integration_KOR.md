---
title: "Github integration"
source: "https://anthropic.skilljar.com/claude-code-in-action/303240"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## Github 통합

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Claude Code는 Claude가 GitHub Actions 내에서 실행될 수 있게 해주는 공식 GitHub 통합을 제공합니다. 이 통합은 두 가지 주요 워크플로를 제공합니다: 이슈 및 풀 요청에 대한 언급 지원 및 자동 풀 요청 리뷰입니다.

## 통합 설정

시작하려면 Claude에서 `/install-github-app`을 실행합니다. 이 명령은 설정 프로세스를 안내합니다:

- GitHub에 Claude Code 앱 설치
- API 키 추가
- 워크플로 파일이 있는 풀 요청을 자동으로 생성합니다

생성된 풀 요청은 두 개의 GitHub Actions를 저장소에 추가합니다. 병합되면 `.github/workflows` 디렉토리에 워크플로 파일이 생깁니다.

## 기본 GitHub Actions

통합은 두 가지 주요 워크플로를 제공합니다:

### 언급 작업

`@claude`를 사용하여 임의의 이슈 또는 풀 요청에서 Claude를 언급할 수 있습니다. Claude가 언급되면:

- 요청을 분석하고 작업 계획을 생성합니다
- 코드베이스에 대한 완전한 액세스로 작업을 실행합니다
- 이슈 또는 PR에서 직접 결과로 응답합니다

### 풀 요청 작업

풀 요청을 생성할 때마다 Claude는 자동으로:

- 제안된 변경 사항을 검토합니다
- 수정의 영향을 분석합니다
- 풀 요청에 자세한 보고서를 게시합니다

## 워크플로 사용자 정의

초기 풀 요청을 병합한 후 워크플로 파일을 사용자 정의하여 프로젝트의 요구에 맞출 수 있습니다. 다음은 언급 워크플로를 개선하는 방법입니다:

### 프로젝트 설정 추가

Claude가 실행되기 전에 환경을 준비하는 단계를 추가할 수 있습니다:

```js
- name: Project Setup
  run: |
    npm run setup
    npm run dev:daemon
```

### 사용자 정의 지침

프로젝트 설정에 대해 Claude에게 컨텍스트를 제공합니다:

```js
custom_instructions: |
  The project is already set up with all dependencies installed.
  The server is already running at localhost:3000. Logs from it
  are being written to logs.txt. If needed, you can query the
  db with the 'sqlite3' cli. If needed, use the mcp__playwright
  set of tools to launch a browser and interact with the app.
```

### MCP 서버 구성

MCP 서버를 구성하여 Claude에게 추가 기능을 제공할 수 있습니다:

```js
mcp_config: |
  {
    "mcpServers": {
      "playwright": {
        "command": "npx",
        "args": [
          "@playwright/mcp@latest",
          "--allowed-origins",
          "localhost:3000;cdn.tailwindcss.com;esm.sh"
        ]
      }
    }
  }
```

## 도구 권한

GitHub Actions에서 Claude를 실행할 때는 모든 허용 도구를 명시적으로 나열해야 합니다. 이는 MCP 서버를 사용할 때 특히 중요합니다.

```js
allowed_tools: "Bash(npm:*),Bash(sqlite3:*),mcp__playwright__browser_snapshot,mcp__playwright__browser_click,..."
```

로컬 개발과 달리 GitHub Actions에는 권한에 대한 바로가기가 없습니다. 각 MCP 서버의 각 도구를 개별적으로 나열해야 합니다.

## 모범 사례

Claude의 GitHub 통합을 설정할 때:

- 기본 워크플로로 시작하여 점진적으로 사용자 정의합니다
- 사용자 정의 지침을 사용하여 프로젝트별 컨텍스트를 제공합니다
- MCP 서버를 사용할 때 도구 권한을 명시적으로 설정합니다
- 복잡한 작업을 시도하기 전에 간단한 작업으로 워크플로를 테스트합니다
- 프로젝트의 특정 요구에 맞는 추가 단계를 고려합니다

GitHub 통합은 Claude를 개발 어시스턴트에서 작업을 처리하고, 코드를 검토하며, GitHub 워크플로 내에서 직접 통찰력을 제공할 수 있는 자동화된 팀 멤버로 변환합니다.
