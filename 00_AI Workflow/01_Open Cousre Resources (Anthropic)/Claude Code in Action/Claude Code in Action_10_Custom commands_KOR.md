---
title: "Custom commands"
source: "https://anthropic.skilljar.com/claude-code-in-action/303234"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## 사용자 정의 명령

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Claude Code에는 슬래시를 입력하여 액세스할 수 있는 내장 명령이 포함되어 있지만, 자주 실행하는 반복적인 작업을 자동화하기 위해 자신의 사용자 정의 명령을 만들 수도 있습니다.

## 사용자 정의 명령 생성

사용자 정의 명령을 생성하려면 프로젝트에서 특정 폴더 구조를 설정해야 합니다:

1. 프로젝트 디렉토리의 `.claude` 폴더를 찾습니다
2. 그 안에 `commands`라는 새 디렉토리를 만듭니다
3. 원하는 명령 이름으로 새 마크다운 파일을 만듭니다(`audit.md` 같은)

파일 이름이 명령 이름이 됩니다. 따라서 `audit.md`는 `/audit` 명령을 생성합니다.

## 예제: 감사 명령

다음은 프로젝트 종속성에 대한 취약점을 감사하는 사용자 정의 명령의 실제 예입니다:

이 감사 명령은 세 가지를 수행합니다:

1. 취약한 설치된 패키지를 찾기 위해 `npm audit`을 실행합니다
2. 업데이트를 적용하기 위해 `npm audit fix`를 실행합니다
3. 업데이트가 어떤 것도 손상하지 않았는지 확인하기 위해 테스트를 실행합니다

명령 파일을 만든 후 Claude Code가 새 명령을 인식하기 위해 다시 시작해야 합니다.

## 인수가 있는 명령

사용자 정의 명령은 `$ARGUMENTS` 자리 표시자를 사용하여 인수를 허용할 수 있습니다. 이는 훨씬 더 유연하고 재사용 가능하게 만듭니다.

예를 들어 `write_tests.md` 명령은 다음과 같을 수 있습니다:

```js
Write comprehensive tests for: $ARGUMENTS

Testing conventions:
* Use Vitests with React Testing Library
* Place test files in a __tests__ directory in the same folder as the source file
* Name test files as [filename].test.ts(x)
* Use @/ prefix for imports

Coverage:
* Test happy paths
* Test edge cases
* Test error states
```

그런 다음 파일 경로로 이 명령을 실행할 수 있습니다:

`/write_tests the use-auth.ts file in the hooks directory`

인수가 파일 경로일 필요는 없습니다. Claude에게 컨텍스트와 방향을 제공하기 위해 전달하려는 모든 문자열이 될 수 있습니다.

## 핵심 이점

- **자동화** - 반복적인 워크플로를 단일 명령으로 전환
- **일관성** - 매번 동일한 단계가 따른다는 것을 보장합니다
- **컨텍스트** - Claude에게 프로젝트에 대한 특정 지침 및 규칙 제공
- **유연성** - 인수를 사용하여 명령을 다양한 입력으로 작동하도록 만듭니다

사용자 정의 명령은 테스트 스위트 실행, 코드 배포 또는 팀의 규칙을 따르는 보일러플레이트 생성과 같이 프로젝트별 워크플로에 특히 유용합니다.
