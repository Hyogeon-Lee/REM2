---
title: "MCP"
source: "https://anthropic.skilljar.com/claude-code-101/469797"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
Model Context Protocol (MCP) is an open standard that lets Claude Code connect to external tools and data sources. When you ask a question, Claude automatically understands when it should use those tools to better handle your query.

A lot of your context lives outside your codebase — in databases, productivity apps, or public repositories. MCP bridges that gap.

## What Can You Do With It?

First, it's important to understand the concept of "tools" in agentic AI. Tools give agents like Claude Code the ability to perform actions that help them complete tasks more effectively. This is different from typical AI, where you just get a text response back.

For example, if your team uses Linear for project management, you can add a Linear MCP server to bring in the details of your specific issues. If you need up-to-date documentation for a dependency, a docs MCP server like Context7 can provide that to Claude Code.

![Claude Code querying a Linear MCP server to retrieve issue details for ticket MEN-12](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686373%2Fvideo10linearmcp.1775686373076.jpg) ![Claude Code using the Context7 MCP server to look up the latest shadcn/ui documentation](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686372%2Fvideo10context7mcp.1775686371940.jpg)

## Adding an MCP Server

You can add MCP servers with the `claude mcp add` command. There are two main types:

![Running claude mcp add to add an HTTP Linear MCP server from the terminal](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686371%2Fvideo10claudemcpaddcommand.1775686370957.jpg)
- **HTTP servers** are for remote services. These are hosted by the service provider and connect over the network.
- **Stdio servers** are for local processes that run on your machine.
![Running claude mcp add to add a local stdio MCP server with a Python script](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686374%2Fvideo10stdioservers.1775686374586.jpg)

You can manage your servers with `/mcp` inside a Claude Code session to see what's connected, check status, and disable servers you don't need.

![The /mcp command showing connected MCP servers and their status](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686374%2Fvideo10slashmcpcommand.1775686373865.jpg)

## Scoping Servers

MCP servers can be scoped in three ways:

1. **Local** — only available in the current project, just for you.
2. **User** — available across all your projects.
3. **Project** — uses a `.mcp.json` file that you check into version control so anyone on the codebase gets the exact same servers automatically.

## Context Costs

MCP servers add tool definitions to your context window — even when you're not actively using them. If you have a lot of servers configured, this eats into your available context. Run `/mcp` to see what's connected and disable anything you're not actively using.

![The /mcp server detail view with options to view tools, reconnect, or disable a server](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686372%2Fvideo10disablingmcpservers.1775686372522.jpg)

If a tool has a CLI equivalent (like `gh` for GitHub or `aws` for AWS), the CLI is more context-efficient because it doesn't add persistent tool definitions.

You might also benefit from using a **Skill** instead. A Skill has a name and description loaded into context, and Claude only loads the full skill contents when it determines it needs to use it.

If your MCP tools exceed 10% of your context window, Claude Code automatically switches to tool search mode, which discovers the right tools on demand — though this may not work as reliably.

## Recap

MCP connects Claude Code to your external tools and data sources. Add servers with `claude mcp add`. Scope them to your project with `.mcp.json` so your team gets them automatically. And keep an eye on context usage by disabling servers you're not actively using.