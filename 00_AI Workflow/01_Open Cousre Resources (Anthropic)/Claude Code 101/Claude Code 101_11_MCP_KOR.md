---
title: "MCP (Model Context Protocol)"
source: "https://anthropic.skilljar.com/claude-code-101/469797"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Model Context Protocol (MCP)는 Claude Code가 외부 도구 및 데이터 소스에 연결할 수 있도록 하는 개방형 표준입니다. 질문을 하면 Claude는 자동으로 쿼리를 더 잘 처리하기 위해 이러한 도구를 사용해야 할 시기를 이해합니다.

코드베이스 외부에 많은 컨텍스트가 존재합니다. 데이터베이스, 생산성 앱, 공개 저장소에 있습니다. MCP가 그 격차를 메웁니다.

## 무엇을 할 수 있나?

먼저 agentic AI에서 "도구"의 개념을 이해하는 것이 중요합니다. 도구는 Claude Code와 같은 에이전트에 작업을 더 효과적으로 완료하는 데 도움이 되는 행동을 수행할 수 있는 능력을 제공합니다. 이것은 단순히 텍스트 응답을 돌려받는 일반적인 AI와 다릅니다.

예를 들어, 팀이 Linear를 프로젝트 관리에 사용하는 경우 Linear MCP 서버를 추가하여 특정 이슈의 세부사항을 가져올 수 있습니다. 의존성에 대한 최신 문서가 필요하면 Context7과 같은 문서 MCP 서버가 Claude Code에 제공할 수 있습니다.

![Claude Code가 Linear MCP 서버를 쿼리하여 ticket MEN-12에 대한 이슈 세부사항을 검색하고 있습니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686373%2Fvideo10linearmcp.1775686373076.jpg) ![Claude Code가 Context7 MCP 서버를 사용하여 최신 shadcn/ui 문서를 조회하고 있습니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686372%2Fvideo10context7mcp.1775686371940.jpg)

## MCP 서버 추가

`claude mcp add` 명령으로 MCP 서버를 추가할 수 있습니다. 두 가지 주요 유형이 있습니다:

![터미널에서 HTTP Linear MCP 서버를 추가하기 위해 claude mcp add 실행](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686371%2Fvideo10claudemcpaddcommand.1775686370957.jpg)

- **HTTP servers**는 원격 서비스를 위한 것입니다. 서비스 제공자가 호스팅하며 네트워크를 통해 연결합니다.
- **Stdio servers**는 컴퓨터에서 실행되는 로컬 프로세스를 위한 것입니다.
![Python 스크립트로 로컬 stdio MCP 서버를 추가하기 위해 claude mcp add 실행](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686374%2Fvideo10stdioservers.1775686374586.jpg)

Claude Code 세션 내에서 `/mcp`로 서버를 관리하여 연결된 것을 보고, 상태를 확인하고, 필요하지 않은 서버를 비활성화할 수 있습니다.

![연결된 MCP 서버와 상태를 보여주는 /mcp 명령](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686374%2Fvideo10slashmcpcommand.1775686373865.jpg)

## Scoping 서버

MCP 서버는 세 가지 방식으로 범위를 지정할 수 있습니다:

1. **Local** — 현재 프로젝트에서만 사용 가능하며 당신을 위해서만 사용됩니다.
2. **User** — 모든 프로젝트에서 사용 가능합니다.
3. **Project** — 버전 관리에 체크인하는 `.mcp.json` 파일을 사용하므로 코드베이스의 모든 사람이 정확히 동일한 서버를 자동으로 얻습니다.

## Context 비용

MCP 서버는 도구 정의를 컨텍스트 창에 추가합니다. 활발히 사용하지 않을 때도 마찬가지입니다. 많은 서버를 구성했으면 이것은 사용 가능한 컨텍스트를 소모합니다. `/mcp`를 실행하여 연결된 것을 보고 활발히 사용하지 않는 것을 비활성화하세요.

![도구 보기, 다시 연결 또는 서버 비활성화 옵션이 있는 /mcp 서버 세부사항 보기](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686372%2Fvideo10disablingmcpservers.1775686372522.jpg)

도구가 CLI 동등물을 가지고 있으면 (GitHub의 `gh` 또는 AWS의 `aws`), CLI는 지속적인 도구 정의를 추가하지 않기 때문에 더 context-efficient합니다.

**Skill**을 사용하는 것이 더 도움이 될 수도 있습니다. Skill의 이름과 설명은 컨텍스트에 로드되고 Claude는 사용이 필요하다고 판단할 때만 전체 skill 내용을 로드합니다.

MCP 도구가 컨텍스트 창의 10%를 초과하면 Claude Code는 자동으로 도구 검색 모드로 전환되어 필요에 따라 올바른 도구를 발견합니다. 하지만 이것이 더 안정적으로 작동하지 않을 수도 있습니다.

## 요약

MCP는 Claude Code를 외부 도구 및 데이터 소스에 연결합니다. `claude mcp add`로 서버를 추가하세요. `.mcp.json`으로 프로젝트에 범위를 지정하여 팀이 자동으로 얻도록 하세요. 그리고 활발히 사용하지 않는 서버를 비활성화하여 context 사용을 주시하세요.
