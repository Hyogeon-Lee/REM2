---
title: "The Claude Code SDK"
source: "https://anthropic.skilljar.com/claude-code-in-action/312001"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## Claude Code SDK

 

이 비디오는 아직 처리 중입니다. 나중에 다시 확인하고 페이지를 새로고침해 주세요.

요약

#### 요약

Claude Code SDK를 사용하면 자신의 응용프로그램과 스크립트 내에서 Claude Code를 프로그래밍 방식으로 실행할 수 있습니다. TypeScript, Python 및 CLI를 통해 사용할 수 있으므로 터미널에서 사용하는 것과 동일한 Claude Code 기능이지만 더 큰 워크플로에 통합되어 있습니다.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618201%2F014_-_The_Claude_Code_SDK_00.1752618201045.png)

SDK는 이미 알고 있는 정확한 Claude Code를 실행합니다. 동일한 모든 도구에 액세스할 수 있으며 해주는 작업을 완료하기 위해 이를 사용합니다. 이는 자동화 및 통합 시나리오에서 특히 강력하게 만듭니다.

## 주요 기능

- Claude Code를 프로그래밍 방식으로 실행
- 터미널 버전과 동일한 Claude Code 기능
- 동일한 디렉토리의 Claude Code 인스턴스에서 설정을 상속합니다
- 기본적으로 읽기 전용 권한
- 더 큰 파이프라인이나 도구의 일부로 가장 유용합니다

## 기본 사용

다음은 중복 쿼리에 대해 코드를 분석하도록 Claude에 요청하는 간단한 TypeScript 예입니다:

```js
import { query } from "@anthropic-ai/claude-code";

const prompt = "Look for duplicate queries in the ./src/queries dir";

for await (const message of query({
  prompt,
})) {
  console.log(JSON.stringify(message, null, 2));
}
```

이 코드를 실행하면 로컬 Claude Code와 Claude 언어 모델 간의 원본 대화가 메시지 단위로 표시됩니다. 최종 메시지는 Claude의 완전한 응답을 포함합니다.

## 권한 및 도구

기본적으로 SDK는 읽기 전용 권한만 가집니다. 파일을 읽고, 디렉토리를 검색하고, grep 작업을 수행할 수 있지만 파일을 쓰거나, 편집하거나, 생성할 수 없습니다.

쓰기 권한을 활성화하려면 쿼리에 `allowedTools` 옵션을 추가할 수 있습니다:

```js
for await (const message of query({
  prompt,
  options: {
    allowedTools: ["Edit"]
  }
})) {
  console.log(JSON.stringify(message, null, 2));
}
```

또는 `.claude` 디렉토리 내의 설정 파일에서 권한을 구성할 수 있습니다. 프로젝트 전체 액세스를 위해.

## 실제 응용

Claude Code SDK는 더 큰 개발 워크플로에 통합될 때 빛을 발합니다. 다음을 위해 사용하는 것을 고려하세요:

- 코드 변경을 자동으로 검토하는 Git Hook (훅)
- 코드를 분석하고 최적화하는 빌드 스크립트
- 코드 유지 관리 작업을 위한 헬퍼 명령
- 자동화된 문서 생성
- CI/CD 파이프라인의 코드 품질 검사

SDK는 기본적으로 개발 프로세스의 어느 부분이든 프로그래밍 방식의 액세스가 유용할 수 있는 곳에 AI 기반 인텔리전스를 추가할 수 있게 해줍니다.
