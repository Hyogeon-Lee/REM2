---
title: "CLAUDE.md 파일"
source: "https://anthropic.skilljar.com/claude-code-101/469795"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Claude Code에서 가장 유용한 기능 중 하나는 CLAUDE.md 파일입니다. 당신의 프로젝트에 대한 persistent memory를 제공합니다.

## 해결하는 문제

CLAUDE.md 파일 없이 Claude Code를 열면 매번 새로 시작합니다. 코드베이스를 다시 탐색해야 하고, 필요한 의존성을 파악해야 하고, 어떤 기능이 이미 구현되었는지 이해해야 합니다. 때때로 가정을 하게 되고, 이는 Claude를 올바른 방향으로 조정하기 어렵게 만듭니다.

CLAUDE.md가 이를 해결합니다. 프로젝트의 루트에 추가하는 Markdown 파일이며 Claude Code는 세션을 시작할 때마다 자동으로 읽습니다. 코드베이스를 위한 온보딩 스크립트로 생각하세요. CLAUDE.md 파일의 내용이 프롬프트에 추가됩니다.

## 예제

일반적인 CLAUDE.md 파일이 어떤 모습인지는 다음과 같습니다:

```js
# Project

This is a Next.js 15 app using the App Router, Tailwind, and Drizzle ORM.

# Commands
- Dev server: \`pnpm dev\`
- Run tests: \`pnpm test\`
- Lint: \`pnpm lint\`

# Code Style
- Use 2-space indentation
- Prefer named exports
- All API routes go in app/api/
- Use server actions instead of API routes where possible
```

간단합니다. 이제 Claude Code에 React 컴포넌트를 만들도록 요청하면 이미 Tailwind를 스타일링에 사용하고 코드 규칙을 따르는 것을 알고 있습니다.

![VS Code에서 열린 CLAUDE.md 파일, 프로젝트 정보, 명령, 코드 스타일 규칙을 보여주고 있습니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686400%2Fvideo8claudemdexample.1775686400069.jpg)

## CLAUDE.md는 팀을 위한 것

CLAUDE.md를 버전 관리에 커밋할 수 있고 (그리고 해야 합니다) 팀이 이점을 얻을 수 있습니다. 실제로 메모리 파일의 누적 단계가 있습니다:

- **Project-level CLAUDE.md**는 프로젝트의 루트 디렉토리에 있습니다. 팀과 공유합니다.
- **User-level CLAUDE.md**는 구성 폴더에 있습니다. 이것은 당신을 위한 것이며 모든 프로젝트에 적용됩니다. 개인 선호도를 여기에 넣으세요.

## 팁

**메모리에 수정사항을 저장하세요.** Claude를 반복해서 수정해야 한다면, 예를 들어 항상 API 경로 대신 서버 액션을 사용하도록 말하고 있다면, Claude에게 그 규칙을 메모리에 저장하도록 명시적으로 요청하세요. 다음 번에 프로젝트를 열 때 이것을 알 것입니다.

![Claude에게 CLAUDE.md 파일에 규칙을 저장하도록 요청합니다. 항상 API 경로 대신 서버 액션을 사용합니다](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686399%2Fvideo8Askingclaudetoputinmemory.1775686399417.jpg)

**프로젝트 문서를 참조하세요.** 프로젝트에 Claude가 참조하기를 원하는 문서가 있으면 `@` 기호를 파일 경로와 함께 사용하세요:

```js
## README.md

Please read if you need more info: @README.md
```

**없이 시작하세요.** 프로젝트를 CLAUDE.md 파일 없이 시작하는 것을 권합니다. 그러면 모델을 지속적으로 과정 수정해야 하는 곳을 볼 수 있습니다. 이것은 CLAUDE.md를 간결하고 필요한 정보에만 집중하게 합니다. 준비가 되면 `/init`을 실행하여 Claude에게 하나를 생성하도록 하세요.

## 요약

답답한 Claude Code 세션과 생산적인 세션의 차이는 종종 컨텍스트로 귀결됩니다. CLAUDE.md 파일이 그 컨텍스트를 제공하는 방법입니다. 스택, 선호도, 명령으로 시작한 다음 진행하면서 구축하세요.
