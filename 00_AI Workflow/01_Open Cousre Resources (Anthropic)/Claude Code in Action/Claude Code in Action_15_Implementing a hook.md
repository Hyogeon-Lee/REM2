---
title: "Implementing a hook"
source: "https://anthropic.skilljar.com/claude-code-in-action/312003"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)## Implementing a hook

 

This video is still being processed. Please check back later and refresh the page.

Summary

#### Summary

Let's build a custom hook to prevent Claude from reading sensitive files like.env. This is a practical example of how hooks can protect your environment variables and other confidential data during development sessions.

## Setting Up the Hook Configuration

First, we need to configure our hook in the settings file. Open your `.claude/settings.local.json` file and locate the hooks section. We'll create a PreToolUse hook since we want to intercept tool calls before they execute.

The configuration requires two key pieces:

- **Matcher** - specifies which tools to watch for
- **Command** - the script that runs when those tools are called

For the matcher, we want to catch both read and grep operations that might access the.env file:

```js
"matcher": "Read|Grep"
```

The pipe symbol (|) acts as an OR operator, so this will trigger on either tool. For the command, we'll point to a Node.js script:

```js
"command": "node ./hooks/read_hook.js"
```

## Understanding Tool Call Data

When Claude attempts to use a tool, your hook receives detailed information about that call through standard input as JSON. This data includes:

- Session ID and transcript path
- Hook event name (PreToolUse in our case)
- Tool name (Read, Grep, etc.)
- Tool input parameters, including the file path

Your hook script processes this data and can either allow the operation to continue or block it by exiting with a specific code.

## Implementing the Hook Script

The hook script needs to read the tool call data from standard input and check if Claude is trying to access the.env file. Here's the core logic:

```js
async function main() {
  const chunks = [];
  for await (const chunk of process.stdin) {
    chunks.push(chunk);
  }
  
  const toolArgs = JSON.parse(Buffer.concat(chunks).toString());
  
  // Extract the file path Claude is trying to read
  const readPath = 
    toolArgs.tool_input?.file_path || toolArgs.tool_input?.path || "";
  
  // Check if Claude is trying to read the .env file
  if (readPath.includes('.env')) {
    console.error("You cannot read the .env file");
    process.exit(2);
  }
}
```

The script checks for.env in the file path and blocks the operation if found. When you exit with code 2, Claude receives an error message and understands the operation was blocked by a hook.

## Testing Your Hook

After saving your configuration and hook script, restart Claude Code for the changes to take effect. Then test it by asking Claude to read your.env file.

When Claude attempts the read operation, your hook will intercept it and return an error message. Claude will recognize that the operation was blocked and explain this to you, often mentioning that a read hook prevented access to the file.

The same protection works for grep operations - if Claude tries to search within the.env file, the hook will block that as well.

## Key Benefits

This approach provides several advantages:

- **Proactive protection** - blocks access before sensitive data is read
- **Transparent operation** - Claude understands why the operation failed
- **Flexible matching** - works with multiple tools (read, grep, etc.)
- **Clear feedback** - provides meaningful error messages

While this specific example focuses on.env files, the same pattern can protect any sensitive files or directories in your project. You can extend the logic to check for multiple file patterns or implement more sophisticated access controls based on your security requirements.