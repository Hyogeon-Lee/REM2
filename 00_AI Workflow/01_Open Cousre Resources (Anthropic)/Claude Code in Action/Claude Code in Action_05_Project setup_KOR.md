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
다운로드

](#)

## 프로젝트 설정

Claude Code로 작업할 때는 함께 작업할 프로젝트가 있으면 더 흥미로워집니다.

Claude Code로 탐색할 수 있도록 작은 프로젝트를 준비했습니다. 이전 비디오에 표시된 것과 동일한 UI 생성 앱입니다. **참고:** 이 프로젝트를 실행할 필요는 없습니다. 코스의 나머지 부분을 자신의 코드 베이스로 따라갈 수 있습니다!

**설정**

이 프로젝트에는 약간의 설정이 필요합니다:

1. Node JS가 로컬에 설치되어 있는지 확인합니다. [설치 지침 링크](https://nodejs.org/en/download).
2. 이 강의에 첨부된 `uigen.zip`이라는 zip 파일을 다운로드하고 압축을 풉니다
3. 프로젝트 디렉토리에서 `npm run setup`을 실행하여 종속성을 설치하고 로컬 SQLite 데이터베이스를 설정합니다
4. **선택사항:** 이 프로젝트는 Anthropic API를 통해 Claude를 사용하여 UI 구성 요소를 생성합니다. 앱을 완전히 테스트하려면 Anthropic API에 액세스할 수 있는 API 키를 제공해야 합니다. *이것은 선택사항입니다. API 키를 제공하지 않으면 앱은 여전히 일부 정적 가짜 코드를 생성합니다.* API 키를 설정하는 방법은 다음과 같습니다:
	1. [https://console.anthropic.com/](https://console.anthropic.com/)에서 Anthropic API 키를 가져옵니다
		2. API 키를 `.env` 파일에 배치합니다
5. `npm run dev`를 실행하여 프로젝트를 시작합니다

요약

#### 다운로드

- [uigen.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1769622681/uigen.zip?response-content-disposition=attachment&Expires=1777367806&Signature=At-2F86vQIEXdCR3xBU1lTJK~pzsoK-apu6gaWAY4bOhddB2JVbPrarJ4SFH4nWUP2U30VEOV6xu24QfUOWqvgqZVeZNhw5hT1TBOu7F3AxDvWQcKNbHZwy6YT0jPHwtaGUrAb1csvXke12ZP7omPEKY3xZtwO6VQiuz8JU41MqIY454e0lJA70Qh-S71c4qBzdwjMhVY-0o-7vwswtUn2CIM-2dSwiwjMFrvyKWKfuAz25WAhlgX0NHcZsxni2rKIerCvN-nUgVpgQsUheUVBXm4FX8YYmDTsZhl3FgYa5lMqYzhXSvmLFkxpOieMn7Zv8htLhdwJtU1iE357k9GA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
