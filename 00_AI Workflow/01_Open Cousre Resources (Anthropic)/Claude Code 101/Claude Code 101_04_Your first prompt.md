---
title: "Your first prompt"
source: "https://anthropic.skilljar.com/claude-code-101/469791"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
You talk to Claude Code like you would any AI assistant. When entering your prompt, here are some things to consider that can both protect you and make things easier.

## Auto-Accept vs. Approval

You can choose whether Claude auto-accepts every file change it suggests, or whether it asks for your explicit permission each time. Press `Shift + Tab` to cycle between modes.

- **Approval mode:** Claude asks permission each time it wants to edit a file or run a command.
- **Auto-accept mode:** File edits are automatically approved, but commands still require your permission.

There's no right or wrong answer — it's whatever you're comfortable with.

![Claude Code in auto-accept mode, reading files and working through a task](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686381%2Fvideo4autoaccept.1775686381332.jpg)

## Plan Mode

Within the `Shift + Tab` menu is **Plan Mode**. Plan mode takes your prompt and uses read-only tools to analyze your codebase and research your suggested implementation. It will ask clarifying questions along the way, then return a detailed plan it can execute.

Plan mode is great for planning complex changes or doing a safe code review. Many times you'll be asking Claude to handle multi-step implementations toward a feature, and this is exactly where Plan Mode excels.

![Claude Code with plan mode on, showing the status bar indicator](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686384%2Fvideo4planmode.1775686383837.jpg)

## Example: Add a Dark Mode Toggle

Let's walk through an example. Say you have an application that needs a dark mode toggle. Open the root directory of your project and run `claude`. Press `Shift + Tab` a couple of times to enter Plan Mode, then write a prompt like:

```js
My app needs a dark mode implemented across the entire app. Can you create a toggle switch on the header that allows a user to toggle between light mode and dark mode? I need you to find a good contrast color that works based on my existing light theme.
```
![Entering the dark mode prompt in Claude Code with plan mode enabled](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686383%2Fvideo4demoenteringpromptinplanmode.1775686382790.jpg)

Let Claude plan it out. After reviewing the plan, if it looks good, accept it and let Claude ask you for approval at each step. At the end, you can see exactly what Claude did and how it reached its conclusions.

## Recap

When using Claude Code, try to be as descriptive as possible with your prompt. If you want to stay in the loop at every step, you can. Use Plan Mode to let Claude dig into the details of what you want to achieve before executing on any code.