---
title: "Claude Code setup"
source: "https://anthropic.skilljar.com/claude-code-in-action/301614"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  

## Claude Code 설정

**이제 Claude Code를 로컬에 설정할 시간입니다!**

전체 설정 지침은 여기에서 찾을 수 있습니다: [https://code.claude.com/docs/en/quickstart](https://code.claude.com/docs/en/quickstart)

간단히 말해서, 다음을 수행해야 합니다:

1. `Claude Code 설치`
	1. `` MacOS (Homebrew): `brew install --cask claude-code` ``
		2. MacOS, Linux, WSL: `curl -fsSL https://claude.ai/install.sh | bash`
		3. Windows CMD: `curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd`
2. 설치 후, 터미널에서 `claude`를 실행합니다. 이 명령을 처음 실행하면 인증하라는 메시지가 표시됩니다

AWS Bedrock 또는 Google Cloud Vertex를 사용하는 경우 추가 설정이 필요합니다:

- AWS Bedrock에 대한 특수 지침: [https://code.claude.com/docs/en/amazon-bedrock](https://code.claude.com/docs/en/amazon-bedrock)
- Google Cloud Vertex에 대한 특수 지침: [https://code.claude.com/docs/en/google-vertex-ai](https://code.claude.com/docs/en/google-vertex-ai)
