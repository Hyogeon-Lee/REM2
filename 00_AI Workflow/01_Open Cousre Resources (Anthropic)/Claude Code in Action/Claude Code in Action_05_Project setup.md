---
title: "Project setup"
source: "https://anthropic.skilljar.com/claude-code-in-action/301615"
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

**1**  
download

](#)

## Project setup

Working with Claude Code is more interesting if you have a project to work with.

I've put together a small project to explore with Claude Code. It is the same UI generation app shown in a previous video. **Note:** you don't have to run this project. You can always follow along with the remainder of the course with your own code base if you wish!

**Setup**

This project requires a small amount of setup:

1. Ensure you have Node JS installed locally. [Link to installation directions](https://nodejs.org/en/download).
2. Download the zip file called `uigen.zip` attached to this lecture and extract it
3. In the project directory, run `npm run setup` to install dependencies and set up a local SQLite database
4. **Optional:** this project uses Claude through the Anthropic API to generate UI components. If you want to fully test out the app, you will need to provide an API key to access the Anthropic API. *This is optional. If no API key is provided, the app will still generate some static fake code.* Here's how you can set the api key:
	1. Get an Anthropic API key at [https://console.anthropic.com/](https://console.anthropic.com/)
		2. Place your API key in the `.env` file.
5. Start the project by running `npm run dev`

Summary

#### Downloads

- [uigen.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1769622681/uigen.zip?response-content-disposition=attachment&Expires=1777367806&Signature=At-2F86vQIEXdCR3xBU1lTJK~pzsoK-apu6gaWAY4bOhddB2JVbPrarJ4SFH4nWUP2U30VEOV6xu24QfUOWqvgqZVeZNhw5hT1TBOu7F3AxDvWQcKNbHZwy6YT0jPHwtaGUrAb1csvXke12ZP7omPEKY3xZtwO6VQiuz8JU41MqIY454e0lJA70Qh-S71c4qBzdwjMhVY-0o-7vwswtUn2CIM-2dSwiwjMFrvyKWKfuAz25WAhlgX0NHcZsxni2rKIerCvN-nUgVpgQsUheUVBXm4FX8YYmDTsZhl3FgYa5lMqYzhXSvmLFkxpOieMn7Zv8htLhdwJtU1iE357k9GA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)