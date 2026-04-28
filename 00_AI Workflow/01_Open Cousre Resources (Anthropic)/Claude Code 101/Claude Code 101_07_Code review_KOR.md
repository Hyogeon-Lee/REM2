---
title: "코드 리뷰"
source: "https://anthropic.skilljar.com/claude-code-101/469794"
author:
published:
created: 2026-04-28
description: "Anthropic의 포괄적인 교육 과정과 훈련 프로그램을 통해 Claude로 구축하는 방법을 배우세요."
tags:
  - "clippings"
---

Claude Code는 git 워크플로우를 더 빠르게 만드는 몇 가지 내장 기능을 가지고 있습니다. 살펴보겠습니다.

## Subagent로 리뷰하기

PR을 푸시하기 전에 Claude에게 **subagent**를 사용하여 변경사항을 검토하도록 요청하세요. Subagent는 자신의 컨텍스트 창에서 실행되며 새로운 눈을 가지고 있습니다. 코드 작성에 방금 세션을 소비한 메인 에이전트의 편견을 가지지 않습니다.

Code-reviewer subagent를 만들 때 읽기 전용 도구로 제한하세요. 리뷰어는 파일을 편집하는 것이 아니라 문제를 지적해야 합니다. Subagent 구성을 repo에 체크인하여 팀 전체가 동일한 리뷰어를 사용하는지 확인하세요.

## The /commit-push-pr Skill

`/commit-push-pr` skill은 커밋, 푸시, PR 생성을 한 단계로 처리합니다. 각각을 수동으로 수행하는 대신 skill을 실행하면 Claude가 모든 것을 처리합니다.

Slack MCP 서버가 구성되어 있고 CLAUDE.md에 채널이 나열되어 있으면 PR 링크를 팀의 채널에 자동으로 게시합니다.

## Session Linking with --from-pr

Claude가 `gh pr create`를 통해 PR을 만들면 세션이 자동으로 그 PR에 링크됩니다. 나중에 돌아와야 하는 경우, 아마도 리뷰 의견을 처리하거나 빌드 실패를 수정하려면 다음을 실행하세요:

```js
claude --from-pr <PR_NUMBER>
```

이것은 정확히 중단한 곳에서 시작합니다.

## 요약

푸시하기 전에 unbiased code review를 위해 subagent를 사용하세요. `/commit-push-pr`을 사용하여 한 단계로 전체 커밋-PR 플로우를 처리하세요. 그리고 `--from-pr`을 사용하여 나중에 PR에서 작업을 재개하세요. 이것은 작은 기능이지만 일일 워크플로우에서 많은 마찰을 제거합니다.
