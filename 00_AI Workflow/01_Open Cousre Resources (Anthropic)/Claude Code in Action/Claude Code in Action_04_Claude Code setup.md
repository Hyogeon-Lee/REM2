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

  

## Claude Code setup

**Time to get Claude Code set up locally!**

Full setup directions can be found here: [https://code.claude.com/docs/en/quickstart](https://code.claude.com/docs/en/quickstart)

In short, you'll need to do the following:

1. `Install Claude Code`
	1. `` MacOS (Homebrew): `brew install --cask claude-code` ``
		2. MacOS, Linux, WSL: `curl -fsSL https://claude.ai/install.sh | bash`
		3. Windows CMD: `curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd`
2. After installation, run `claude` at your terminal. The first time you run this command you will be prompted to authenticate

If you're making use of AWS Bedrock or Google Cloud Vertex, there is some additional setup:

- Special directions for AWS Bedrock: [https://code.claude.com/docs/en/amazon-bedrock](https://code.claude.com/docs/en/amazon-bedrock)
- Special directions for Google Cloud Vertex: [https://code.claude.com/docs/en/google-vertex-ai](https://code.claude.com/docs/en/google-vertex-ai)