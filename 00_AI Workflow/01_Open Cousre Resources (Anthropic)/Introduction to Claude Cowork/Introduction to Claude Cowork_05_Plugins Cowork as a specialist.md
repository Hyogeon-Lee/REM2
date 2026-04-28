---
title: "Plugins: Cowork as a specialist"
source: "https://anthropic.skilljar.com/introduction-to-claude-cowork/444168"
author:
  - "[[the end of this lesson]]"
  - "[[you will be able to:]]"
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  

### ⁠

**Estimated time:** 15 minutes

### Learning objectives

- Explain what a plugin is and what's inside it
- Install a plugin that matches your role
- Understand skills as the building blocks plugins are made of

---

### What a plugin is

![Plugins: turn Cowork into a specialist for your role](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1773939289%2Fslide-10-plugins.1773939289619.png)

Overview

Plugins give Cowork domain expertise. Each one comes with built-in knowledge and workflows for a specific function, so Claude approaches your task the way a specialist would.

A plugin is a bundle—several pieces packaged together for a role or domain:

- **Skills** — Instructions for handling specific workflows. Claude draws on them automatically, or you invoke them with `/` in the prompt. *Example: how to structure a deal brief, `/prep-call`, `/weekly-report`.*
- **Connectors** — Reach the systems where the work happens. *Example: your CRM, your docs, your messaging.*
- **Subagents** — Parallelize specialized work. *Example: one agent per account in a book-wide review.*

Open-source plugins are available for most knowledge-work roles: sales, marketing, product, finance, legal, operations, customer support, data, and more. They work as-is and can be modified.

### Installing a plugin

![Installing plugins: browse, install, customize](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6oz04skclb1pbkcboeiosbn5o%2Fpublic%2F1774046474%2Fslide-11-installing-plugins.1774046473979.png)

Overview

1. **Browse.** Plugins live in Cowork's **Customize** area. Find one that matches what you do.
2. **Install.** One click. The plugin is active immediately.
3. **Customize.** Once installed, the plugin is a folder on your machine. Everything in it is readable and editable.

### What's inside

A plugin is just a folder. The structure looks something like this:

> ```js
> sales-plugin/
> ├── plugin.json         ← manifest: name, description, dependencies
> ├── skills/
> │   ├── deal-brief/     ← how to structure a deal brief
> │   ├── territory/      ← how to build a territory report
> │   └── prep-call/      ← /prep-call in the slash menu
> └── agents/
>     └── account-sweep.md ← subagent for per-account work
> ```

Every file is plain text. To change how a skill works, open its file and edit it. To add a new skill, add a folder under skills. There's no build step—Cowork reads the folder directly.

### About skills

You'll notice skills show up a lot—they're the core building block inside plugins. A skill is a markdown file that teaches Claude how to handle one thing: a workflow, a format, a process.

Skills aren't specific to Cowork. They work across Claude's surfaces—in chat, in Claude Code, anywhere Claude runs. A plugin is the Cowork-specific way of bundling skills with the connectors they need to do a job.

![](https://www.youtube.com/watch?v=bjdBVZa66oU)

If you want to go deeper on skills specifically:

- [Skills video course on YouTube](https://www.youtube.com/playlist?list=PLmWCw1CzcFim_hkruZSlABOUOAAQ5JMyo) — six-part walkthrough
- [What are Skills](https://support.claude.com/en/articles/12512176) — Help Center reference
- [Teach Claude your way of working](https://claude.com/resources/tutorials/teach-claude-your-way-of-working-using-skills) — tutorial on encoding your own processes
- [Introduction to Agent Skills](https://anthropic.skilljar.com/introduction-to-agent-skills) — full course

### Put it into practice

1. Open Cowork's Customize area and browse plugins.
2. Install the plugin closest to your role.
3. Find the installed plugin folder and open one of the skill files. See that it's readable text, written the way you'd brief a teammate.

### Learn more about plugins

- [Plugin directory](https://claude.com/plugins) — browse all plugins, Anthropic and community-built
- [Use plugins in Cowork](https://support.claude.com/en/articles/13837440-use-plugins-in-cowork) — Help Center guide to installing and setup
- [How to customize plugins in Cowork](https://claude.com/resources/tutorials/how-to-customize-plugins-in-cowork)
- [Build a plugin from scratch](https://claude.com/resources/tutorials/how-to-build-a-plugin-from-scratch-in-cowork)
- [Cowork plugins announcement](https://claude.com/blog/cowork-plugins)
- [Knowledge-work plugins on GitHub](https://github.com/anthropics/knowledge-work-plugins)
- [Financial-services plugins on GitHub](https://github.com/anthropics/financial-services-plugins)

### What's next

Next: scheduled tasks. Once you have a task that works well—whether it's a plugin skill or a prompt you wrote—you can set it to run on a schedule without prompting each time.

#### Feedback

Share your feedback [here](https://forms.gle/sY9ou5fqZBd3TjHF8).

#### Acknowledgments and license

*Copyright 2026 Anthropic. All rights reserved.*