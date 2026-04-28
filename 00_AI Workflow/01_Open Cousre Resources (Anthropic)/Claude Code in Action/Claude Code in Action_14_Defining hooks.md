---
title: "Defining hooks"
source: "https://anthropic.skilljar.com/claude-code-in-action/312002"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)

[

**2**  
download

](#)

## Defining hooks

 

This video is still being processed. Please check back later and refresh the page.

Summary

#### Summary

Hooks in Claude Code allow you to intercept and control tool calls before or after they execute. This gives you fine-grained control over what Claude can and cannot do in your development environment.

## Building a Hook

Creating a hook involves four main steps:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618153%2F011_-_Defining_Hooks_05.1752618152864.png)

1. **Decide on a PreToolUse or PostToolUse hook** - PreToolUse hooks can prevent tool calls from executing, while PostToolUse hooks run after the tool has already been used
2. **Determine which type of tool calls you want to watch for** - You need to specify exactly which tools should trigger your hook
3. **Write a command that will receive the tool call** - This command gets JSON data about the proposed tool call via standard input
4. **If needed, command should provide feedback to Claude** - Your command's exit code tells Claude whether to allow or block the operation

## Available Tools

Claude Code provides several built-in tools that you can monitor with hooks:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618153%2F011_-_Defining_Hooks_07.1752618153492.png)

To see exactly which tools are available in your current setup, you can ask Claude directly for a list. This is especially useful since the available tools can change when you add custom MCP servers.

## Tool Call Data Structure

When your hook command executes, Claude sends JSON data through standard input containing details about the proposed tool call:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618154%2F011_-_Defining_Hooks_11.1752618154320.png)

```js
{
  "session_id": "2d6a1e4d-6...",
  "transcript_path": "/Users/sg/...",
  "hook_event_name": "PreToolUse",
  "tool_name": "Read",
  "tool_input": {
    "file_path": "/code/queries/.env"
  }
}
```

Your command reads this JSON from standard input, parses it, and then decides whether to allow or block the operation based on the tool name and input parameters.

## Exit Codes and Control Flow

Your hook command communicates back to Claude through exit codes:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1752618154%2F011_-_Defining_Hooks_16.1752618154725.png)

- **Exit Code 0** - Everything is fine, allow the tool call to proceed
- **Exit Code 2** - Block the tool call (PreToolUse hooks only)

When you exit with code 2 in a PreToolUse hook, any error messages you write to standard error will be sent to Claude as feedback, explaining why the operation was blocked.

## Example Use Case

A common use case is preventing Claude from reading sensitive files like `.env` files. Since both the `Read` and `Grep` tools can access file contents, you'd want to monitor both tool types and check if they're trying to access restricted file paths.

This approach gives you complete control over Claude's file system access while providing clear feedback about why certain operations are restricted.

#### Downloads

- [queries.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1773097175/queries.zip?response-content-disposition=attachment&Expires=1777368009&Signature=o34ZkdiBm9jY30YlQQ2HX0X3YU~r8vCEhhFncOVJJE2WDN2EVaFfpcoPZS5WAXYe6gk3mv~K9tg5obe2~JySqtllNOIMRqk2LoiPJtDLDCovPeuVleUeOgNsqhklbGg0fPeC07Wzg7IiBKjinCCMmVI82tZM5OTxZUmYpSdNv~lVZchmMCRFt8JHIWK55vVu8RBwiP5ulmm5U-U4ms9VZsrky6DtkMWqt6Z00oq3AKNJGKs0t3mztYqqZ68-KSG4NcJB-j4wYeJz8YTl2RKJqzPA5HVJMWqv5WjOT-OKNB5wdTfa~xc-Cft2257BEst319L2F074E-P1rmNC7c6gSA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [queries\_COMPLETED.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1773097185/queries_COMPLETED.zip?response-content-disposition=attachment&Expires=1777368009&Signature=u92LxZMT8WN5hsePHB0ldHsFVxNMmX28z47tcvmxlaQ~gmRb9HCpU9IFkI66wBh2AiH~Jp5AMODEpHU25E-jKbedAGuu8YOGinYRXWrgkFeUyi6Zrr8zEEHSfIjbo2~De8r-EPyQRFH3GbWE~RJJDVvtOwz9rzdajbcSnDgVdqAl2x-gnRFOWbdRi6r2qam4UiOHzHg1stQD8hR3LWhsGe5fFmlz3TJJ4XUYnMa4xnWDglJAW7QT0MKIKZP6Ef7udm8PrjC~Yg0XHxQ9HZW5MMpf4OAlB64PQ0XVMj7nYgrWARZr~-rXeicHwXLO9o882hPY3OmK9lWf6Sd~PBHGgw__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)