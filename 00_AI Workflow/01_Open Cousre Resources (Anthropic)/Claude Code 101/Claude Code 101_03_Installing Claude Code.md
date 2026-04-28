---
title: "Installing Claude Code"
source: "https://anthropic.skilljar.com/claude-code-101/469790"
author:
published:
created: 2026-04-28
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
Claude Code is simple to install whether you want to use it in your terminal, on the web, or in your IDE.

## Terminal

On **macOS, Linux, or WSL**, use the curl command to install it in one go. If you prefer Homebrew, you can also use `brew install`, but note that this method doesn't support auto-updates.

On **Windows**, there are a few options. In PowerShell, use the `Invoke-RestMethod` command. In CMD, use the curl command. There's also a winget command available, though like Homebrew, it won't auto-update.

![Terminal showing Claude Code successfully installed via curl](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686381%2Fvideo3terminalinstall.1775686380887.jpg)

After installation, you should be able to run the `claude` command. If not, restart your terminal. Navigate to your project directory and run:

```js
claude
```

You'll go through some initial setup steps like choosing your color theme and signing in with your Claude account (Pro, Max, or Enterprise) or using an API key. If your organization has a Claude Enterprise account, be sure to select that option. ![Claude Code login method selection: subscription, API, or third-party platform](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686379%2Fvideo3claudeinitaccounts.1775686379767.jpg)

Whatever directory you run `claude` in, it will have access to that directory and all of its subfolders.

## Visual Studio Code

Open your Extensions panel and search for "Claude Code." Look for the extension by Anthropic with the blue verification check. Hit install.

After installation, you may need to restart VS Code. Once it's running, open the command palette with `Ctrl/Cmd + Shift + P` and search for "Claude Code Open in New Tab." You can also click the Claude logo if it's visible in your sidebar.

![Claude Code extension page in VS Code marketplace](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686378%2Fvideo3claudecodevscode.1775686378631.jpg)

The VS Code extension provides a very similar experience to the terminal. You can also opt out of the UI and use the terminal experience directly in your settings.

## JetBrains

Install the Claude Code plugin from the JetBrains Marketplace. After installation, restart your IDE. When you reopen it, you'll see the Claude logo. Clicking it opens a pane with the terminal experience that works alongside your editor.

![Claude Code plugin in the JetBrains Marketplace](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686367%2Fclaudecodejetbrainsvideo3.1775686367876.jpg)

## Desktop

After installing and signing into Claude Desktop, you'll see a toggle at the top labeled "Code." The look and feel is similar to the chat side of things, but it lets you work in a specific folder, change permissions, and even work in a cloud environment. ![Claude Desktop Code view showing recent project folders](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686367%2Fclaudecodedesktopvideo3github.1775686366970.jpg)

## Web

On the web, access Claude Code by going to `claude.ai/code`, or by clicking the "Code" label in the sidebar of the chat app. This works similarly to the desktop app, but you're restricted to GitHub repositories.

![Claude Code on the web at claude.ai/code with repository selection](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F8lsy243ftffjjy1cx9lm3o2bw%2Fpublic%2F1775686365%2Fclaudeaislashcodevideo3.1775686365598.jpg)

## Which One Should I Use?

If you want to stay on the cutting edge, the **terminal** is your best bet — features ship there first. The IDE integrations offer a nearly identical experience if you prefer Claude Code to feel more intertwined with your code editor.

**Desktop** is great for letting Claude run in the background while you handle other tasks.

**Claude Code on the web** is a solid option if you want to remotely work on projects through a GitHub repository.

However you want to use Claude Code is up to you.