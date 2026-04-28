---
title: "Gotchas around hooks"
source: "https://anthropic.skilljar.com/claude-code-in-action/312423"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  

## Hook(훅)과 관련된 주의사항들

`npm run dev` 명령을 실행한 후 `.claude` 디렉토리에 두 개의 `settings.json` 파일이 있음을 알 수 있습니다. 여기서 무슨 일이 일어나고 있는지 설명하겠습니다.

Claude Code 문서는 Hook 보안에 대한 몇 가지 권장사항을 나열합니다:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752683124%2FScreenshot+2025-07-16+at+10.25.07%E2%80%AFAM.1752683124012.png)

권장사항 중 하나는 스크립트에 절대 경로를 사용하는 것입니다(상대 경로 대신). 이는 [경로 가로채기(path interception)](https://attack.mitre.org/techniques/T1574/007/) 및 [바이너리 심기(binary planting)](https://owasp.org/www-community/attacks/Binary_planting) 공격을 완화하는 데 도움이 됩니다.

이 권장사항은 `settings.json` 파일을 공유하기를 훨씬 더 까다롭게 만듭니다. 이유는 간단합니다: **당신의** 머신에 있는 Hook 스크립트의 절대 경로는 내 머신의 절대 **경로**와 다를 가능성이 높습니다. 우리가 프로젝트를 서로 다른 디렉토리에 배치할 것이기 때문입니다.

이 문제를 해결하기 위해 프로젝트에는 `settings.example.json` 파일이 있습니다. 그 안에는 스크립트 참조가 `$PWD` 자리 표시자를 포함합니다. `npm run setup`을 실행하면 종속성이 설치되지만 스크립트 디렉토리 내에 있는 `init-claude.js` 스크립트도 실행됩니다. 이 스크립트는 해당 `$PWD` 자리 표시자를 머신의 프로젝트에 대한 절대 경로로 바꾸고, `settings.example.json` 파일을 복사하고, 이를 `settings.local.json`으로 이름을 바꿉니다.

이 스크립트를 통해 설정 파일을 공유할 수 있으면서도 권장되는 절대 경로를 사용할 수 있습니다!
