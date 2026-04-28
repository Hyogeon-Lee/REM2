---
title: "Claude Code 설치"
source: "https://anthropic.skilljar.com/claude-code-101/469790"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Claude Code는 터미널, 웹, IDE 어디에서 사용하더라도 간단하게 설치할 수 있습니다.

## Terminal (터미널)

**macOS, Linux, WSL**에서는 curl 명령을 사용하여 한 번에 설치할 수 있습니다. Homebrew를 선호한다면 `brew install`도 사용할 수 있지만, 이 방법은 자동 업데이트를 지원하지 않는다는 점에 유의하세요.

**Windows**에서는 몇 가지 옵션이 있습니다. PowerShell에서는 `Invoke-RestMethod` 명령을 사용하고, CMD에서는 curl 명령을 사용하세요. winget 명령도 사용 가능하지만, Homebrew와 마찬가지로 자동 업데이트되지 않습니다.

![curl을 통해 Claude Code가 성공적으로 설치되었음을 보여주는 터미널](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686381%2Fvideo3terminalinstall.1775686380887.jpg)

설치 후 `claude` 명령을 실행할 수 있어야 합니다. 그렇지 않으면 터미널을 다시 시작하세요. 프로젝트 디렉토리로 이동한 후 다음을 실행하세요:

```js
claude
```

색상 테마 선택, Claude 계정(Pro, Max, Enterprise)으로 로그인 또는 API 키 사용 등 초기 설정 단계를 거치게 됩니다. 조직에 Claude Enterprise 계정이 있다면 해당 옵션을 반드시 선택하세요. ![Claude Code 로그인 방법 선택: 구독, API, 또는 타사 플랫폼](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686379%2Fvideo3claudeinitaccounts.1775686379767.jpg)

`claude`를 실행한 디렉토리가 어디든, 그 디렉토리와 모든 하위 폴더에 접근할 수 있습니다.

## Visual Studio Code

Extensions 패널을 열고 "Claude Code"를 검색하세요. 파란색 확인 마크(verification check)가 있는 Anthropic의 확장을 찾아 설치(install)를 클릭하세요.

설치 후 VS Code를 재시작해야 할 수도 있습니다. 실행되면 `Ctrl/Cmd + Shift + P`로 명령 팔레트(command palette)를 열고 "Claude Code Open in New Tab"을 검색하세요. 사이드바에 Claude 로고가 보인다면 클릭해도 됩니다.

![VS Code marketplace의 Claude Code 확장 페이지](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686378%2Fvideo3claudecodevscode.1775686378631.jpg)

VS Code 확장은 터미널과 매우 유사한 경험을 제공합니다. 설정에서 UI를 끄고 터미널 환경을 직접 사용하도록 선택할 수도 있습니다.

## JetBrains

JetBrains Marketplace에서 Claude Code 플러그인을 설치하세요. 설치 후 IDE를 재시작합니다. 다시 열면 Claude 로고가 보입니다. 클릭하면 에디터 옆에서 함께 작동하는 터미널 환경이 담긴 창이 열립니다.

![JetBrains Marketplace의 Claude Code 플러그인](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686367%2Fclaudecodejetbrainsvideo3.1775686367876.jpg)

## Desktop

Claude Desktop을 설치하고 로그인하면 상단에 "Code"라고 표시된 토글이 보입니다. 모양과 느낌은 채팅 쪽과 유사하지만, 특정 폴더에서 작업하고 권한을 변경하며 클라우드 환경에서도 작업할 수 있습니다. ![최근 프로젝트 폴더를 보여주는 Claude Desktop Code 보기](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686367%2Fclaudecodedesktopvideo3github.1775686366970.jpg)

## Web

웹에서는 `claude.ai/code`로 이동하거나 채팅 앱 사이드바의 "Code" 레이블을 클릭하여 Claude Code에 접근할 수 있습니다. 데스크톱 앱과 유사하게 작동하지만 GitHub 저장소로만 제한됩니다.

![repository 선택이 있는 claude.ai/code의 Claude Code](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686365%2Fclaudeaislashcodevideo3.1775686365598.jpg)

## 어떤 것을 사용해야 하나?

최첨단 기능을 원한다면 **터미널**이 최선의 선택입니다. 새 기능은 터미널에서 가장 먼저 출시됩니다. IDE 통합은 Claude Code가 코드 에디터와 더 긴밀하게 통합되기를 원할 때 거의 동일한 경험을 제공합니다.

**Desktop**은 Claude가 백그라운드에서 작업하는 동안 다른 일을 처리하고 싶을 때 좋습니다.

**Claude Code on the web**은 GitHub repository를 통해 원격으로 프로젝트 작업을 하고 싶을 때 견고한 선택지입니다.

Claude Code를 어떤 방식으로 사용할지는 전적으로 당신에게 달려 있습니다.
