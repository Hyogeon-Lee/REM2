# Anthropic AI Courses — 한국어 통합 가이드

> **출처**: Anthropic Skilljar 11개 코스 / 106개 레슨 (`https://anthropic.skilljar.com/`)
> **클리핑 일자**: 2026-04-28
> **본 문서**: 11개 코스 ↔ 6개 Part 재구성 한국어 종합본
> **표기 규칙**: 본문 한국어, 기술용어·툴명·명령어·UI 라벨은 영문 그대로 병기 (예: 계획 모드(Plan Mode), `claude mcp add`)

---

## 목차

- [Part I. AI 작동 원리 — How AI Works](#part-i-ai-작동-원리--how-ai-works)
- [Part II. 올바른 사용 — 4D Framework](#part-ii-올바른-사용--4d-framework)
- [Part III. Claude 제품군 (Chat / Cowork / Code)](#part-iii-claude-제품군-chat--cowork--code)
- [Part IV. Claude Code 본체](#part-iv-claude-code-본체)
- [Part V. Claude Code 확장 도구 — Subagents · Skills · MCP · Hooks](#part-v-claude-code-확장-도구--subagents--skills--mcp--hooks)
- [Part VI. AI Fluency 응용 — Educators · Students · Teaching](#part-vi-ai-fluency-응용--educators--students--teaching)
- [부록 A. 용어 사전](#부록-a-용어-사전)
- [부록 B. 도구 결정 가이드 (Skill / Subagent / Slash / MCP / Hook)](#부록-b-도구-결정-가이드)
- [부록 C. 명령어 치트시트](#부록-c-명령어-치트시트)
- [부록 D. 원본 레슨 인덱스 (106 레슨 → 본 문서 매핑)](#부록-d-원본-레슨-인덱스)

---

# Part I. AI 작동 원리 — How AI Works

## I-1. Generative AI 기초 (Generative AI Fundamentals)

> **출처**: AI Fluency Foundations 04
> **3줄 요약**: 생성형 AI는 데이터 분석을 넘어 새로운 콘텐츠를 만들어낸다. 트랜스포머(Transformer) 아키텍처, 대규모 학습 데이터, 강화된 컴퓨팅 파워의 결합이 LLM 등장의 핵심. 학습은 사전훈련(pre-training)과 미세조정(fine-tuning) 두 단계로 진행된다.

**핵심 개념**

- **Generative AI** — 기존 데이터의 패턴 분석을 넘어 새로운 텍스트·이미지·코드 등을 생성하는 AI
- **Transformer Architecture** — Self-attention 기반의 현대 LLM 핵심 알고리즘
- **Pre-training** — 수십억 개 예제에서 통계적 패턴(언어 구조, 사실, 추론 패턴) 학습
- **Fine-tuning** — 명령(instruction)을 따르고 도움이 되는 응답을 내도록 조정 (RLHF 등)
- **Token** — 모델이 처리하는 텍스트 최소 단위 (대략 단어 또는 단어 일부)
- **Context window** — 모델이 한 번에 처리 가능한 토큰 수의 상한 (Claude 200K, Pro/Max/Team/Enterprise는 1M까지 지원)
- **Emergent capability** — 규모가 커지며 예기치 않게 발현되는 능력 (예: 도구 사용, in-context learning)

**LLM이 등장한 3가지 기술적 돌파**

1. **알고리즘 / 아키텍처**: 트랜스포머의 self-attention
2. **데이터**: 디지털 학습 자료의 폭발적 증가
3. **컴퓨팅**: GPU/TPU와 대규모 분산 학습

**관련**: → [I-2 Capabilities & Limitations](#i-2-capabilities--limitations), → [II-2 Description](#ii-2-description--효과적-프롬프트-기법)

---

## I-2. Capabilities & Limitations

> **출처**: AI Fluency Foundations 05, Claude 101_01
> **3줄 요약**: LLM은 다양한 언어 작업·문맥 유지·맥락 전환에 강하지만, 지식 컷오프(knowledge cutoff), 환각(hallucination), 컨텍스트 윈도우 제약, 복잡한 추론에 한계가 있다. 가장 효과적인 활용은 인간의 비판적 사고·윤리적 판단과 결합될 때이다.

**능력 (Capabilities)**

- 광범위한 언어 작업 (요약·번역·작성·분석)
- 맥락 유지 및 다중 작업 전환 — 별도 학습 없이 새 작업 수행 (versatility)
- 외부 도구 호출 및 통합 (tool use)
- 단계적 추론 (extended thinking, chain-of-thought)
- 다중 형식 처리 (텍스트·이미지·문서·코드)

**한계 (Limitations)**

- **Knowledge cutoff** — 학습 데이터 종료 시점 이후 정보 부정확
- **Hallucination** — 사실과 무관한 정보를 자신감 있게 생성
- **Context window 제약** — 매우 긴 문서는 한 번에 처리 불가 (RAG 등으로 보완)
- **복잡한 추론의 불안정성** — 다단계 수학·논리에서 오류 발생
- **시간·공간 일관성 약점** — 긴 시뮬레이션에서 상태 추적 실패

**Constitutional AI**

Claude는 "도움이 되고(helpful), 해롭지 않고(harmless), 정직(honest)"하도록 학습된 Constitutional AI 원칙으로 설계됨.

**관련**: → [II-3 Discernment](#ii-3-discernment--출력-비판적-평가), → [II-4 Diligence](#ii-4-diligence--책임감-있는-사용)

---

## I-3. AI와 사람의 협업 양상 — Automation / Augmentation / Agency

> **출처**: AI Fluency Foundations 02, 03
> **3줄 요약**: AI 협업은 세 가지 양상으로 구분된다. Automation은 AI가 지정 작업을 자동 수행, Augmentation은 인간-AI가 함께 사고·작업, Agency는 AI가 자율적으로 행동하도록 지식·행동을 형성. 학습 맥락에서는 Augmentation이 가장 가치 있다.

| 양상 | 정의 | 예시 |
|---|---|---|
| **Automation** | 사용자 지시에 따라 AI가 정해진 작업 자동 수행 | 일상 메일 분류, 정형 보고서 |
| **Augmentation** | 인간과 AI가 창의적 사고·실행 파트너로 협업 | 논문 초안 함께 다듬기, 코드 리뷰 |
| **Agency** | AI가 자율적으로 작업 수행, 사용자는 지식·행동 패턴을 형성 | 장시간 백그라운드 리서치, 자동화 파이프라인 |

**원문 인용**: *"Three primary ways we engage with AI: Automation, Augmentation, and Agency."*

**관련**: → [Part II 4D Framework](#part-ii-올바른-사용--4d-framework) (4D는 세 양상 모두에 적용)

---

# Part II. 올바른 사용 — 4D Framework

> **출처**: AI Fluency Foundations 03·06·07·08·09·10·11·12·13
> **개요**: 4D는 AI와의 효과적이고 책임감 있는 협업을 위한 4가지 핵심 역량 — Delegation, Description, Discernment, Diligence. 기술 변화에 무관하게 지속 적용 가능한 보편 프레임워크.

```
┌─────────────────────────────────────────────────────────┐
│                       4D Framework                       │
├──────────────┬──────────────┬──────────────┬───────────┤
│  Delegation  │ Description  │ Discernment  │ Diligence │
│  (위임)      │ (설명)       │ (식별)       │ (성실)    │
├──────────────┼──────────────┼──────────────┼───────────┤
│ 무엇을 AI에  │ AI에 의도를  │ AI 출력을    │ 책임 있게 │
│ 맡길 것인가  │ 명확히 전달  │ 비판적 평가  │ 실행      │
└──────────────┴──────────────┴──────────────┴───────────┘
        ↘ Delegation-Diligence Loop ↙ (거시 전략·윤리)
        ↘ Description-Discernment Loop ↙ (미시 협업)
```

---

## II-1. Delegation — 무엇을 AI에 맡길 것인가

> **3줄 요약**: Delegation은 자신의 작업과 AI에 위임할 작업을 전략적으로 분배하는 능력. Problem Awareness(목표 명확화), Platform Awareness(AI 능력·한계 이해), Task Delegation(역할 분담)의 3가지 하위 요소. 분야 전문성과 AI 이해의 균형이 핵심.

**3가지 하위 요소**

1. **Problem Awareness** — 목표·필요 작업·성공 기준의 명확한 이해
2. **Platform Awareness** — 사용 중인 AI 시스템의 능력·한계 파악 (Claude vs 다른 모델, 모델 티어 차이)
3. **Task Delegation** — 인간이 잘하는 부분과 AI가 잘하는 부분의 전략적 분배

**프로젝트 계획 적용 (AI Fluency Foundations 07)**

중규모 멀티스텝 프로젝트를 선정하여:

1. 비전·성공 기준 명확화
2. 필수 작업 식별 및 세분화
3. 각 작업별 인간 강점 vs AI 가능성 분석
4. 협업 계획 문서화 (이후 Description·Discernment·Diligence 학습에 재사용)

**관련**: → [II-4 Diligence](#ii-4-diligence--책임감-있는-사용), → [Part VI Educators](#vi-1-ai-fluency-for-educators)

---

## II-2. Description — 효과적 프롬프트 기법

> **출처**: AI Fluency Foundations 08·09, Claude 101_02·03
> **3줄 요약**: Description은 단순 명령이 아니라 AI와 함께 작업할 협업 환경을 조성하는 의사소통. Product(결과물), Process(접근 방식), Performance(상호작용 방식) 3차원으로 명확화. AI는 사용자의 마음을 읽지 못하므로 사전 소통이 반복 수정 비용을 크게 절감한다.

**3가지 차원**

| 차원 | 내용 |
|---|---|
| **Product** | 결과물의 포맷·길이·스타일·대상 청중 |
| **Process** | 문제 해결 접근법·선호하는 방법론·단계 순서 |
| **Performance** | AI의 상호작용 톤 (간결/상세, 도전적/지지적, 격식/캐주얼) |

**6가지 핵심 프롬프팅 기법**

1. **Give Context** — 목표·배경·관련 정보 제공
2. **Show Examples** — 원하는 스타일·포맷 시연 (few-shot)
3. **Specify Constraints** — 길이·포맷·출력 요구사항 명시
4. **Break Complex Tasks into Steps** — 다단계 작업의 단계별 안내
5. **Ask AI to Think First** — 사고 과정 공간 부여 (chain-of-thought)
6. **Define Role or Tone** — 역할(예: "당신은 X 전문가") 또는 톤 지정

**Secret Weapon**: AI 자신에게 자기 프롬프트 개선을 요청하라.

**Claude.ai에서의 프롬프트 3 요소** (Claude 101_02)

- **Setting the stage** — 역할·맥락
- **Defining the task** — 구체 액션
- **Specifying rules** — 스타일·포맷

**원문 인용**: *"AI can't read your mind, and how the quality of your results often comes down to how clearly you articulate your needs, preferred approach, and desired interaction style."*

**관련**: → [II-3 Discernment](#ii-3-discernment--출력-비판적-평가), → [IV-4 CLAUDE.md](#iv-4-claudemd--프로젝트-지침-파일)

---

## II-3. Discernment — 출력 비판적 평가

> **출처**: AI Fluency Foundations 10
> **3줄 요약**: Discernment는 Description의 거울상으로, AI 출력을 비판적으로 평가하는 능력. Product(산출물 품질), Process(사고 과정 검증), Performance(상호작용 평가)의 3차원. 분야 전문성이 가장 신뢰할 수 있는 평가 기준이다.

**3가지 차원**

| 차원 | 평가 대상 |
|---|---|
| **Product Discernment** | 정확도·관련성·일관성·완결성 |
| **Process Discernment** | 추론 논리·근거의 타당성·환각 여부 |
| **Performance Discernment** | 협업 중 AI 응답의 효과성·적절성 |

**핵심 원칙**

- 가장 고도화된 AI 시스템도 인간의 판단·감독으로 이득을 본다.
- 자신이 전문성 가진 영역에서 평가 시 환각 식별이 쉬워진다.
- 자동화될수록 검증의 필요성은 더 크다.

**원문 인용**: *"Even the most advanced AI systems benefit from human judgment and oversight."*

**관련**: → [II-5 Description-Discernment Loop](#ii-5-description-discernment-loop)

---

## II-4. Diligence — 책임감 있는 사용

> **출처**: AI Fluency Foundations 12, AI Fluency for Students 05
> **3줄 요약**: Diligence는 AI 협업의 윤리·안전·책임을 담당하는 역량. Creation Diligence(어떤 AI와 어떻게 협업할지), Transparency Diligence(AI 역할 공개), Deployment Diligence(결과 검증·책임)의 3차원. 맥락에 따라 기대 수준이 다르지만 모든 협업에서 투명성·책임이 필수.

**3가지 차원**

1. **Creation Diligence** — AI 시스템 선택, 데이터 공유 시 개인정보·보안·윤리 고려
2. **Transparency Diligence** — AI 역할의 명시적 공개 (학술·직업 맥락별 기준 부응)
3. **Deployment Diligence** — 출력 검증, 정확성 확인, 최종 책임 감수

**Diligence Statement 예시**

> "본 자료의 초안은 Claude와의 협업으로 작성되었으며, 최종 검토·인용·결론은 저자가 직접 수행하였다."

**Human in the Loop** (AI Fluency for Students 05)

AI 상호작용의 모든 순간에 판단력·창의성·윤리를 유지하는 의사결정자로서의 인간 역할. 개인 AI 협업 정책 수립 권고.

**관련**: → [V-3 MCP 권한·범위](#v-3-mcp-model-context-protocol), → [IV-3 권한 관리](#iv-3-context-management)

---

## II-5. Description-Discernment Loop

> **출처**: AI Fluency Foundations 11, Teaching AI Fluency 03
> **3줄 요약**: Description(명확 지시)과 Discernment(비판 평가)는 순환 피드백으로 작동하여 협업 품질을 지속 향상. 매 작업: 명확 설명 → 결과 평가 → 피드백·개선 → 인간 전문성 통합의 반복.

**4단계 순환**

```
1. Describe (명확하게 설명: Product/Process/Performance)
        ↓
2. Discern  (출력 평가: 같은 3차원)
        ↓
3. Refine   (피드백 제공, 설명 조정, 반복)
        ↓
4. Integrate (인간의 전문성·판단을 최종 결과에 통합)
        ↓
   (다음 작업으로 → Describe)
```

**Delegation-Diligence Loop** (Teaching AI Fluency 02)

거시적 전략·윤리 의사결정의 양방향 순환:
- Delegation이 Diligence 질문을 제기 ("이 작업을 AI에 맡겨도 안전한가?")
- Diligence 고려가 Delegation 전략을 재형성 ("리스크가 크니 인간이 직접 수행")

**원문 인용**: *"Description-Discernment loops are productive feedback processes where you describe, evaluate, refine, and integrate."*

---

# Part III. Claude 제품군 (Chat / Cowork / Code)

## III-1. Claude Desktop App: 3가지 모드 비교

> **출처**: Claude 101_04, Cowork_01

| 모드 | 최적 작업 | 핵심 기능 |
|---|---|---|
| **Chat** | 빠른 대화·반복 개선·창의 작업 | Quick entry (Mac: Option 더블탭), 스크린샷, 받아쓰기, Connectors |
| **Cowork** | 멀티스텝·대용량·파일 산출 | 폴더 접근, Plugins, Scheduled tasks, Subagents, Computer use, Browser use |
| **Code** | 소프트웨어 개발 | Ask/Code/Plan 모드, visual diff, git 통합, 로컬·원격 환경 |

> Cowork와 Code는 동일한 Claude Code 엔진 위에서 실행됨. Chat은 Claude.ai와 동일한 모델에 데스크톱 통합 기능이 더해진 것.

**선택 가이드**

- 결과를 텍스트로 받기만 하면 됨 → **Chat**
- 실제 파일(`.xlsx`, `.pdf`, `.pptx`)을 만들거나 대용량을 분석 → **Cowork**
- 코드베이스 작업, git 워크플로 → **Code**

---

## III-2. Projects (지속 작업의 워크스페이스)

> **출처**: Claude 101_05

**구성 요소**

- **Knowledge base** — 참고 문서 모음 (PDF, DOCX, CSV 등 업로드)
- **Custom instructions** — 프로젝트 전용 행동 가이드
- **Permission levels** — Can view / Can edit / Owner (Team/Enterprise)

**RAG 모드**

지식 베이스가 컨텍스트 한계에 접근하면 자동으로 Retrieval Augmented Generation 모드 전환. 용량 최대 10배 확대하면서 응답 품질 유지.

**원문 인용**: *"Projects are self-contained workspaces with their own memory, chat histories, knowledge bases, and customized instructions."*

---

## III-3. Artifacts (산출물 생성·편집)

> **출처**: Claude 101_06

**자동 생성 조건**

- 15줄 이상
- 자체 포함된 코드/텍스트
- 재사용 가능한 형태

**지원 포맷**

Documents, Code, HTML, SVG, Mermaid 다이어그램, React 컴포넌트.

**공유**

- **Team/Enterprise**: 내부 공유
- **모든 사용자**: 공개 게시 (검색엔진 비색인, 링크 공유)
- **Remix**: 게시된 artifact를 자신의 대화로 열어 수정

---

## III-4. Skills on Claude.ai

> **출처**: Claude 101_07

> ⚠️ Claude.ai의 "Skills"와 Claude Code의 "Agent Skills"(Part V-2)는 동일 개념의 다른 인터페이스 노출. SKILL.md 포맷은 동일하며 Chat/Code/Cowork 어디서나 작동.

**두 종류**

1. **Anthropic Skills (내장)** — 자동 호출 (Excel, PowerPoint, PDF, Word 생성)
2. **Custom Skills** — 조직·개인이 반복 워크플로 인코딩

**Skills vs Projects**

> *"Projects are knowledge hubs (참고 자료의 'WHAT'), Skills are procedural machines (실행 방법의 'HOW')."*

**활성화**: Settings > Capabilities > Code execution and file creation toggle

---

## III-5. Connectors / Enterprise Search

> **출처**: Claude 101_08·09

**Connectors** — Claude를 Google Drive, Notion, Slack, Asana, GitHub 등 외부 도구에 연결.

- **Web connectors** — 클라우드 서비스
- **Desktop extensions** — 로컬 앱
- **MCP 기반** — Model Context Protocol이 표준 (Part V-3 참조)

**보안**: Claude는 사용자가 이미 접근 가능한 데이터만 본다. 권한별 disconnect 가능.

**Enterprise Search** — 조직 전체 지식 베이스를 위한 사전 구성 Project. SharePoint, Slack, Gmail, Drive 등 다중 소스 통합 검색. "Ask {Org Name}" 사이드바로 노출.

---

## III-6. Research Mode (심층 조사)

> **출처**: Claude 101_10

**프로세스**

1. 접근 방식 계획 (extended thinking 자동 활성화)
2. 다중 검색을 순차적으로 누적 수행
3. 정보 종합·인용 제공

**소요 시간**: 5–15분 일반, 복잡한 경우 최대 45분.

**전제조건**: Web search 활성화.

---

## III-7. Claude Cowork 심화

> **출처**: Cowork_01–10

### III-7-a. Task Loop (Cowork_03)

```
1. 작업 설명 (Input → Transformation → Output)
        ↓
2. Claude가 명료화 질문 또는 계획 제시
        ↓
3. 진행 중 모니터링·개입 가능 (Progress 패널)
        ↓
4. 완료 파일 검토 (초안으로 취급)
```

### III-7-b. Context (Cowork_04)

- **Projects** — 로컬 폴더 기반 워크스페이스 (Cowork 전용)
- **Instructions panel** — 프로젝트별 행동 가이드
- **Global Instructions** — Settings > Cowork → 모든 작업 공통 (예: "삭제 전 항상 확인")
- **"Tell me what you know"** — Claude가 인식한 컨텍스트 검증

### III-7-c. Plugins (Cowork_05)

> Plugins = Skills + Connectors + Subagents 번들 (역할별 전문성).

- 1클릭 설치 (Customization > Browse)
- 폴더 구조 (`plugin.json`, `skills/`, `agents/`) 직접 편집 가능
- 빌드 단계 없이 플레인 텍스트로 작동

### III-7-d. Scheduled Tasks (Cowork_06)

- 시간/일/주/커스텀 주기 반복 실행
- `/schedule` 명령 또는 사이드바에서 설정
- 데스크톱 앱이 켜져 있을 때만 실행, 놓친 작업은 재시작 시 캐치업

### III-7-e. File & Document Tasks (Cowork_07)

**프롬프트 패턴**: Input(소스) → Transformation(변환) → Output(포맷·위치)

네이티브 형식으로 출력 (편집 가능 차트, 작동 수식, 트랙 변경).

### III-7-f. Research & Analysis at Scale (Cowork_08)

**Cowork가 Chat보다 나은 경우**:

- **Volume** — 붙여넣기 불가능한 대용량
- **Parallelism** — N개 항목을 동시 분석
- **In-place computation** — 업/다운로드 사이클 없이 원위치 처리

**프레임 질문**: "요약해라"보다 *"신호를 찾아라 — 일치점, 모순, 위험"*

### III-7-g. Permissions·Usage·Model (Cowork_09)

- **Isolated execution** — 격리 환경에서만 코드 실행
- **삭제 전 명시 승인** 권장
- **모델 선택**: Opus (복잡), Sonnet (기본), Haiku (가볍고 빠름)

---

# Part IV. Claude Code 본체

> **출처**: Claude Code 101 (12), Claude Code in Action (18)
> **개요**: Claude Code는 터미널·IDE·데스크톱·웹에서 실행되는 에이전트 기반 코딩 도구. 파일 편집·명령 실행·외부 도구 연동을 자연어로 지시.

## IV-1. 정의·아키텍처·설치

### IV-1-a. 정의 (Claude Code 101_01·02)

**Agentic Loop**:

```
Prompt → Gather Context → Take Action (Tool Use) → Verify → Loop or Finish
```

**핵심 구성**:

- **Agentic loop** — 반복적 작업 수행
- **Managed context window** — 자동 압축 포함
- **Tools** — 파일 읽기·쓰기, 명령 실행, 검색, 외부 도구
- **Configurable permissions** — 승인 필수 / 자동수락 / Plan Mode

**원문 인용**: *"Claude Code is an agentic coding tool that understands your codebase, edits your files, runs commands, and integrates with your existing developer tools."*

### IV-1-b. 설치 (Claude Code 101_03, in Action_04)

```bash
# macOS, Linux, WSL
curl -fsSL https://claude.ai/install.sh | bash

# Windows PowerShell
Invoke-RestMethod -Uri 'https://claude.ai/install.cmd' -OutFile 'install.cmd' -UseBasicParsing; .\install.cmd; rm install.cmd

# Homebrew (auto-update 미지원)
brew install --cask claude-code

# 실행
claude
```

**플랫폼별 특성**

- **터미널** — 신기능 우선 출시
- **VS Code / JetBrains 확장** — 터미널과 유사 경험 + IDE 통합
- **Desktop / Web** — Claude.ai에서 GitHub 리포지토리 작업

---

## IV-2. 핵심 워크플로 — Explore → Plan → Code → Commit

> **출처**: Claude Code 101_05 (코스 전체에서 가장 중요한 패턴)

```
┌─────────┐   ┌──────┐   ┌──────┐   ┌────────┐
│ Explore │ → │ Plan │ → │ Code │ → │ Commit │
└─────────┘   └──────┘   └──────┘   └────────┘
   읽기         계획        실행       리뷰·푸시
   전용         (Plan Mode) (자동수락)  (서브에이전트)
```

### IV-2-a. Explore + Plan (Plan Mode)

**진입**: `Shift + Tab` 반복 → "Plan Mode" 표시

**특징**: 파일 편집 불가, 읽기 전용 도구로 정보 수집 후 계획 제시.

**예시 프롬프트**:

```text
I need to add WebP conversion to our image upload pipeline.
Figure out where in the pipeline it should happen, whether we
need new dependencies, and how to approach it.
```

> 가장 좋은 코스 수정 지점은 **계획 단계** — 코드가 작성되기 전.

### IV-2-b. Code

- 계획 승인 → 자동 실행
- **성공 기준 명시** — Claude가 "완료"를 판단할 기준
- **Tools 추가** — Claude in Chrome (브라우저 테스트), MCP 서버 등
- **테스트 스위트** — Claude가 지속 검증 가능한 신뢰할 수 있는 테스트

> 같은 이슈가 반복되면 "이 해결책을 CLAUDE.md에 저장해" 요청.

### IV-2-c. Commit

1. 서브에이전트 코드 리뷰어 호출 (`/agents`) — 메인 에이전트의 편향 제거
2. 리뷰 피드백 반영
3. Claude가 프로젝트 스타일에 맞는 커밋 메시지 생성

> 또는 `/commit-push-pr` 스킬로 한 번에 커밋·푸시·PR 생성. `claude --from-pr <NUM>`으로 PR 작업 재개.

**원문 인용**: *"If you take one thing away from this course, let it be this workflow: Explore, Plan, Code, and Commit."*

---

## IV-3. Context Management

> **출처**: Claude Code 101_06, in Action_09

**컨텍스트 윈도우** = Claude의 작업 메모리 (유한). 한도 접근 시 자동 압축(compaction) 발생 — 세부정보 손실 위험.

### 핵심 명령

| 명령 | 용도 |
|---|---|
| `/compact` | 현재 대화 요약 압축 (관련 작업 계속할 때) |
| `/clear` | 히스토리 완전 제거 (다른 작업 시작) |
| `/context` | 현재 사용량·카테고리별 분석 표시 |
| `Esc` (한 번) | 응답 중단 |
| `Esc` (두 번) | 과거 메시지 목록 → 특정 지점으로 되감기 |
| `#` (메모리 모드) | CLAUDE.md에 지능형 저장 |

### 컨텍스트 절감 전략

1. **구체적 프롬프트** — 모호한 프롬프트가 더 많은 탐색 비용 유발
2. **CLAUDE.md** — 자주 참조하는 정보를 영구 저장
3. **MCP 절제** — 사용하지 않는 MCP 서버 비활성화 (도구 정의가 컨텍스트 차지)
4. **CLI 우선** — `gh`, `aws` 등 CLI는 도구 정의를 컨텍스트에 로드하지 않음
5. **서브에이전트 위임** — 무거운 탐색은 별도 컨텍스트에서

**원문 인용**: *"Be specific. A vague prompt might seem smaller, but it actually costs more context in the long run."*

---

## IV-4. CLAUDE.md — 프로젝트 지침 파일

> **출처**: Claude Code 101_08, in Action_06

**역할**: 프로젝트 영구 메모리. 매 세션마다 자동 로드.

### 3단계 계층

```
1. 프로젝트 (./CLAUDE.md)         ← 팀 공유, git 커밋
   + ./CLAUDE.local.md            ← 개인 설정, .gitignore
2. 사용자 (~/.claude/CLAUDE.md)   ← 개인 전역
3. 글로벌                          ← 모든 프로젝트 공통 선호
```

### 자동 생성

- `/init` — Claude가 코드베이스 분석 후 CLAUDE.md 생성

### 작성 예시

```markdown
# Project
This is a Next.js 15 app using App Router, Tailwind, Drizzle ORM.

# Commands
- Dev server: `pnpm dev`
- Run tests: `pnpm test`
- Lint: `pnpm lint`

# Code Style
- 2-space indentation
- Prefer named exports
- All API routes go in app/api/
- Use server actions where possible

# References
- Database schema: @prisma/schema.prisma
- README: @README.md
```

### `@` 멘션 / `#` 메모리 모드

- `@<path>` — 파일 콘텐츠를 매 요청에 자동 포함
- `#<text>` — 메모리 모드 진입, Claude가 CLAUDE.md에 지능형 저장

**원문 인용**: *"The difference between a frustrating Claude Code session and a productive one often comes down to context — and the CLAUDE.md file is how you provide that context."*

---

## IV-5. Code Review (서브에이전트 활용)

> **출처**: Claude Code 101_07

**핵심**: 메인 에이전트는 자기 작업에 편향됨 → 서브에이전트가 신선한 시각으로 리뷰.

### 워크플로

1. 기능 구현 + 로컬 테스트 완료
2. `/agents` 명령 → 코드 리뷰어 서브에이전트 호출
3. 읽기 전용 도구만 부여 → 문제 지적만 수행
4. 피드백 반영
5. `/commit-push-pr` 스킬 또는 수동 커밋

### Slack MCP 통합

PR 생성 시 자동으로 Slack 채널에 링크 게시 가능.

### 세션-PR 연결

- `gh pr create` 사용 시 자동 연결
- `claude --from-pr 123` — PR #123 작업 재개

---

## IV-6. Custom Commands / Slash Commands

> **출처**: Claude Code in Action_10

**위치**: `.claude/commands/<name>.md`

**파일명 = 명령어 이름** (예: `audit.md` → `/audit`)

### 기본 예시

```markdown
<!-- .claude/commands/audit.md -->
Run npm audit to find vulnerable packages, then run npm audit fix,
and finally run tests to verify the updates didn't break anything.
```

### `$ARGUMENTS` 자리표시자

```markdown
<!-- .claude/commands/write_tests.md -->
Write comprehensive tests for: $ARGUMENTS

Conventions:
- Vitest with React Testing Library
- __tests__ directory next to source
- [filename].test.ts(x) naming
- @/ prefix for imports

Coverage:
- Happy paths
- Edge cases
- Error states
```

**호출**: `/write_tests src/utils/parser.ts`

> Claude Code 재시작 필요.

---

## IV-7. GitHub Integration

> **출처**: Claude Code in Action_12

### 설치

```bash
/install-github-app
```

GitHub Actions 워크플로 자동 생성.

### 두 가지 액션

1. **Mention Action** — 이슈/PR에 `@claude` 멘션 → 분석·작업
2. **Pull Request Action** — 모든 PR 자동 코드 리뷰

### 워크플로 커스터마이징

```yaml
- name: Project Setup
  run: |
    npm run setup
    npm run dev:daemon

custom_instructions: |
  Project is set up with all dependencies.
  Server is running at localhost:3000.
  Logs in logs.txt.
  Query db with 'sqlite3' cli.
  Use mcp__playwright__* to interact with the app.

mcp_config: |
  {
    "mcpServers": {
      "playwright": {
        "command": "npx",
        "args": ["@playwright/mcp@latest", "--allowed-origins", "localhost:3000"]
      }
    }
  }

allowed_tools: "Bash(npm:*),Bash(sqlite3:*),mcp__playwright__browser_snapshot,..."
```

---

## IV-8. Claude Code SDK

> **출처**: Claude Code in Action_19

**용도**: Claude Code를 프로그래머적으로 호출 (TypeScript / Python / CLI). Git hooks·CI/CD·빌드 스크립트 통합.

### TypeScript 예시

```typescript
import { query } from "@anthropic-ai/claude-code";

const prompt = "Look for duplicate queries in the ./src/queries dir";

for await (const message of query({
  prompt,
  options: {
    allowedTools: ["Edit"]   // 기본은 읽기 전용
  }
})) {
  console.log(JSON.stringify(message, null, 2));
}
```

**기본 권한**: 읽기 전용 (Read·Glob·Grep). 편집 필요 시 `allowedTools` 명시 또는 `.claude/settings.json` 프로젝트 수준 설정.

---

## IV-9. Adding Context — 스크린샷·Thinking Modes

> **출처**: Claude Code in Action_06·07

### 스크린샷 붙여넣기

`Ctrl+V` (Mac도 동일, **`Cmd+V` 아님**)

### Thinking Modes

`Shift+Tab` 한 번 후 선택:

- **Think** — 기본 추론 강화
- **Think more** / **Think a lot** / **Think longer** — 점진적 강화
- **Ultrathink** — 최대 추론

> Plan Mode와 Thinking Mode는 동시 사용 가능 (추가 토큰 비용).

| 상황 | 모드 |
|---|---|
| 코드베이스 광범위 탐색 필요 | **Plan Mode** |
| 복잡한 알고리즘·버그 분석 | **Thinking Mode** |
| 둘 다 | **둘 다** |

---

# Part V. Claude Code 확장 도구 — Subagents · Skills · MCP · Hooks

> **개요**: Claude Code의 4대 확장 메커니즘. 각각 다른 문제 영역을 다룸.

| 도구 | 트리거 | 컨텍스트 | 주 용도 |
|---|---|---|---|
| **Subagent** | 메인이 위임 결정 | 격리 (separate window) | 무거운 탐색·코드 리뷰·페르소나 분리 |
| **Skill** | 요청 의도 매칭 (lazy load) | 현재 대화 | 반복 절차 인코딩 (How-to) |
| **MCP** | 클라이언트 연결 | 도구 정의가 매 세션 로드 | 외부 도구·데이터 (GitHub·DB·Linear 등) |
| **Hook** | 라이프사이클 이벤트 | 별도 프로세스 | 결정론적 자동화·차단·후처리 |

---

## V-1. Subagents

> **출처**: Claude Code 101_09, Introduction to Subagents 01–04

### V-1-a. 정의

- **격리된 컨텍스트 윈도우**에서 실행
- 메인 에이전트는 **요약**만 받음 (중간 작업 숨김)
- 전용 **시스템 프롬프트** 보유

**원문 인용**: *"With subagents, you can run an agent in the background to handle the heavy lifting and return just the answer to your main context window."*

### V-1-b. 생성 (`/agents` 명령)

```bash
/agents
```

대화형 인터페이스:

1. "Create new agent" 선택
2. 범위(scope): 프로젝트(`.claude/agents/`) 또는 사용자(`~/.claude/agents/`)
3. 목적·도구·모델·색상 정의
4. Claude가 name, description, system prompt 생성

### V-1-c. Frontmatter 형식

```yaml
---
name: code-quality-reviewer
description: Use this agent when you need to review recently written or modified code for quality, security, and best practice compliance. Use proactively after completing implementation work.
tools: Bash, Glob, Grep, Read, WebFetch, WebSearch
model: sonnet
color: purple
---

You are an expert code reviewer specializing in quality assurance,
security best practices, and adherence to project standards.
Your role is to thoroughly examine recently written or modified code
and identify issues that could impact reliability, security,
maintainability, or performance.
```

### V-1-d. 효과적 설계

- **`description`이 트리거 시점·입력을 결정** — 명확하게 작성
- **"proactively" 추가** — Claude가 자동 위임하도록 유도
- **도구 제한** — 역할에 필요한 최소 도구만 부여 (보안)
- **구조화된 출력 형식** 지정 — 자연스러운 종료 지점·품질 보장

### V-1-e. 출력 구조 예시

```text
1. Summary — 리뷰 개요·전체 평가
2. Critical Issues — 보안·데이터·논리 오류 (즉시 수정)
3. Major Issues — 품질·아키텍처·성능
4. Minor Issues — 스타일·문서·소형 최적화
5. Recommendations — 개선·리팩토링·베스트 프랙티스
6. Approval Status — 머지/배포 준비 여부
7. Obstacles Encountered — 검토 중 만난 환경 이슈, 우회책, 의존성 문제
```

### V-1-f. 언제 쓰는가

| ✅ 적합 | ❌ 부적합 (안티패턴) |
|---|---|
| Research / Exploration — 중간 과정이 노이즈 | Sequential pipeline — 정보 손실 큼 |
| Code review — 신선한 시각 필요 | "Expert" 페르소나 — 가치 거의 없음 |
| Custom system prompt 필요 (스타일링·카피라이팅) | Test runner — 디버깅 방해 |

**핵심 판단 질문**: *"Does the intermediate work matter?"* 그렇다 → 메인에서 / 아니다 → 서브에이전트.

### V-1-g. 내장 서브에이전트

- **General purpose**
- **Explore** — 코드베이스 탐색 전용
- **Plan** — 계획 수립 전용

---

## V-2. Skills (Agent Skills)

> **출처**: Claude Code 101_10, Introduction to Agent Skills 01–06

### V-2-a. 정의

> Skills = 특정 작업 수행법을 인코딩한 **마크다운 파일 + 스크립트** 모음. **lazy loading**으로 필요할 때만 전체 내용 로드 → 컨텍스트 효율적.

**vs CLAUDE.md**: CLAUDE.md는 매 세션 자동 로드, Skill은 요청 의도와 description이 매칭될 때만.

### V-2-b. 위치 우선순위

```
Enterprise managed > Personal (~/.claude/skills/) > Project (.claude/skills/) > Plugins
```

### V-2-c. SKILL.md 구조

```yaml
---
name: pr-description
description: Writes pull request descriptions. Use when creating a PR, writing a PR, or when the user asks to summarize changes for a pull request.
allowed-tools: Read, Grep, Glob, Bash
model: sonnet
---

When writing a PR description:

1. Run `git diff main...HEAD` to see all changes on this branch
2. Write a description following this format:

## What
One sentence explaining what this PR does.

## Why
Brief context on why this change is needed.

## Changes
- Bullet points of specific changes
- Group related changes
- Mention any deletions or renames
```

**필드**

- `name` (필수) — 식별자
- `description` (필수) — 매칭 기준 ("무엇을" + "언제"에 답할 것)
- `allowed-tools` (선택) — 도구 화이트리스트
- `model` (선택) — 모델 지정

### V-2-d. 디렉토리 + 다중 파일

```
~/.claude/skills/codebase-onboarding/
├── SKILL.md             ← 메인, 500줄 이하 권장
├── architecture.md      ← 참고자료 (lazy)
├── glossary.md
└── scripts/
    └── analyze.sh       ← 결과만 토큰 소비
```

**Progressive Disclosure**: SKILL.md에서 필요시 `@architecture.md` 등으로 추가 자료 참조.

### V-2-e. Skills vs 다른 기능

| 비교 | Skills | 대상 기능 |
|---|---|---|
| vs **CLAUDE.md** | 필요시 로드 | 항상 로드 (프로젝트 표준) |
| vs **Subagents** | 현재 대화 강화 | 격리 실행 |
| vs **Hooks** | 요청 기반 | 이벤트 기반 (자동) |
| vs **MCP** | 마크다운 절차 지식 | 외부 도구·데이터 연결 |

### V-2-f. 공유

- **프로젝트 스킬** — git 커밋 → 팀 자동 공유
- **플러그인** — 마켓플레이스·repo 배포
- **Enterprise managed** — `strictKnownMarketplaces` 설정으로 승인된 출처만 허용

```json
"strictKnownMarketplaces": [
  { "source": "github", "repo": "acme-corp/approved-plugins" },
  { "source": "npm", "package": "@acme-corp/compliance-plugins" }
]
```

### V-2-g. 트러블슈팅

| 증상 | 점검 |
|---|---|
| 트리거 안됨 | `description` 개선 (의도·시점 명확화) |
| 로드 안됨 | 경로·파일명·YAML 구문 확인 |
| 잘못된 스킬 발동 | description 더 구체화 |
| 우선순위 밀림 | 이름 변경 |
| 플러그인 스킬 미표시 | 캐시 정리·재설치 |
| 런타임 오류 | `chmod +x`, 경로 구분자, 의존성 확인 |
| 디버그 | `claude --debug` |

> 서브에이전트는 스킬을 자동 상속하지 **않음** — frontmatter `skills:` 필드에 명시.

---

## V-3. MCP (Model Context Protocol)

> **출처**: Claude Code 101_11, in Action_11, Introduction to MCP 01–14

### V-3-a. 정의

> **MCP는 Claude를 외부 도구·데이터 소스에 연결하는 개방형 표준**. 도구 정의·실행 로직을 전용 MCP 서버로 위임 — 개발자가 매번 통합 코드를 새로 작성할 필요 없음.

**유추**: USB-C for AI — 단일 표준 인터페이스로 다양한 앱 연결.

**원문 인용**: *"MCP shifts this burden by moving tool definitions and execution from your server to dedicated MCP servers."*

### V-3-b. 아키텍처

```
┌──────────────┐       ┌──────────────┐       ┌──────────────┐
│ Application  │ ←———→ │  MCP Client  │ ←———→ │  MCP Server  │
│ (Claude Code)│       │  (Transport  │       │ (GitHub/DB/..) │
│              │       │   agnostic)  │       │              │
└──────────────┘       └──────────────┘       └──────────────┘
                              ↑
                  stdio / HTTP / WebSocket
```

### V-3-c. 3가지 원시 타입 (Primitives)

| 타입 | 제어 주체 | 사용 예 |
|---|---|---|
| **Tools** | Claude 자율 결정 (model-controlled) | `read_doc_contents`, `edit_document` |
| **Resources** | 앱 코드가 결정 (app-controlled) | `docs://documents/{doc_id}` |
| **Prompts** | 사용자 트리거 (user-controlled) | 슬래시 명령, 메뉴, 버튼 |

### V-3-d. Tool 정의 (Python SDK)

```python
from mcp.server.fastmcp import FastMCP
from pydantic import Field

mcp = FastMCP("DocumentMCP", log_level="ERROR")

docs = {
    "deposition.md": "Testimony of Angela Smith, P.E.",
    "report.pdf":    "20m condenser tower state report.",
}

@mcp.tool(
    name="read_doc_contents",
    description="Read the contents of a document and return it as a string."
)
def read_document(
    doc_id: str = Field(description="Id of the document to read")
):
    if doc_id not in docs:
        raise ValueError(f"Doc with id {doc_id} not found")
    return docs[doc_id]

@mcp.tool(
    name="edit_document",
    description="Edit a document by replacing a string in its contents."
)
def edit_document(
    doc_id: str = Field(description="Id of the document to edit"),
    old_str: str = Field(description="Exact text to replace, including whitespace"),
    new_str: str = Field(description="New text to insert")
):
    if doc_id not in docs:
        raise ValueError(f"Doc with id {doc_id} not found")
    docs[doc_id] = docs[doc_id].replace(old_str, new_str)
```

### V-3-e. Resource 정의 (Direct + Templated)

```python
@mcp.resource("docs://documents", mime_type="application/json")
def list_docs() -> list[str]:
    return list(docs.keys())

@mcp.resource("docs://documents/{doc_id}", mime_type="text/plain")
def fetch_doc(doc_id: str) -> str:
    if doc_id not in docs:
        raise ValueError(f"Doc with id {doc_id} not found")
    return docs[doc_id]
```

**클라이언트 접근**:

```python
import json
from pydantic import AnyUrl

async def read_resource(self, uri: str):
    result = await self.session().read_resource(AnyUrl(uri))
    resource = result.contents[0]
    if isinstance(resource, types.TextResourceContents):
        if resource.mimeType == "application/json":
            return json.loads(resource.text)
    return resource.text
```

### V-3-f. Prompt 정의

```python
from mcp.server.fastmcp.prompts import base

@mcp.prompt(
    name="format",
    description="Rewrites the contents of the document in Markdown format."
)
def format_document(
    doc_id: str = Field(description="Id of the document to format")
) -> list[base.Message]:
    prompt = f"""
Your goal is to reformat a document to be written with markdown syntax.

The id of the document you need to reformat is:
<document_id>
{doc_id}
</document_id>

Add headers, bullet points, tables as necessary.
Use the 'edit_document' tool to apply edits.
"""
    return [base.UserMessage(prompt)]
```

### V-3-g. Server Inspector (개발 디버깅)

```bash
mcp dev mcp_server.py
```

브라우저 기반 인터페이스 — Tools / Resources / Prompts 각 섹션에서 실시간 테스트.

### V-3-h. Claude Code에 MCP 서버 추가

```bash
# HTTP 서버 (원격 서비스)
claude mcp add linear

# Stdio 서버 (로컬 프로세스)
claude mcp add myserver python ./server.py

# 관리
/mcp
```

### V-3-i. Scope (3단계)

| Scope | 위치 | 공유 범위 |
|---|---|---|
| **Local** | 현재 프로젝트의 settings (개인) | 본인만 |
| **User** | `~/.claude/...` | 모든 본인 프로젝트 |
| **Project** | `.mcp.json` (git 커밋) | 코드베이스 모든 사용자 |

```json
// .mcp.json
{
  "mcpServers": {
    "linear": {
      "command": "npx",
      "args": ["@linear/claude-mcp"]
    }
  }
}
```

### V-3-j. Context Cost 관리

- MCP 서버는 모든 도구 정의를 **매 세션 컨텍스트에 로드** (사용 안 해도)
- 사용 안 하는 서버는 `/mcp`에서 disable
- CLI 대안 있으면 (예: `gh`, `aws`) CLI 우선 — 도구 정의 부담 없음
- MCP 도구가 컨텍스트 10% 초과 시 자동 **tool search mode**로 전환 (신뢰성 다소 저하)

### V-3-k. Playwright MCP 예 (in Action_11)

```bash
claude mcp add playwright npx @playwright/mcp@latest
```

```json
// .claude/settings.local.json
{
  "permissions": {
    "allow": ["mcp__playwright"],
    "deny": []
  }
}
```

브라우저 제어로 UI 테스트·시각적 출력 분석 자동화.

---

## V-4. Hooks

> **출처**: Claude Code 101_12, in Action_13–18

### V-4-a. 정의

> **Hooks = Claude Code 라이프사이클 이벤트 전·후에 결정론적으로 실행되는 명령**. 프롬프트가 아니라 **항상 실행 보장**이 필요한 작업에 사용.

**원문 인용**: *"If something needs to happen every time without fail, don't put it in a prompt. Put it in a hook."*

### V-4-b. 9가지 이벤트

| 이벤트 | 시점 | 차단 가능? |
|---|---|---|
| `PreToolUse` | 도구 실행 **전** | ✅ exit 2 |
| `PostToolUse` | 도구 실행 **후** | ❌ |
| `UserPromptSubmit` | 사용자 입력 직후 | ✅ |
| `Notification` | 알림 발생 | ❌ |
| `Stop` | 작업 종료 | ❌ |
| `SubagentStop` | 서브에이전트 종료 | ❌ |
| `PreCompact` | 자동 압축 직전 | ❌ |
| `SessionStart` | 세션 시작 | ❌ |
| `SessionEnd` | 세션 종료 | ❌ |

### V-4-c. 구조 (`settings.json`)

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Read|Grep",
        "hooks": [
          {
            "type": "command",
            "command": "node $CLAUDE_PROJECT_DIR/hooks/read_hook.js"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "prettier --write $FILE_PATH"
          }
        ]
      }
    ]
  }
}
```

- **`matcher`** — 정규표현식으로 도구 이름 필터
- **`command`** — 실행할 셸 명령
- **`$CLAUDE_PROJECT_DIR`** — 프로젝트 루트 절대 경로 환경변수

### V-4-d. Stdin JSON 입력 구조

훅은 stdin으로 JSON을 받음:

```json
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

> `tool_input`은 도구별로 구조 다름 (Read의 `file_path`, Bash의 `command` 등).

### V-4-e. Exit Code 의미

| Exit code | 의미 |
|---|---|
| `0` | 진행 (성공) |
| `2` | 차단 (PreToolUse·UserPromptSubmit 등에서). stderr 메시지가 Claude에 전달됨 |
| 기타 | 일반 오류 |

### V-4-f. 구현 예 — `.env` 읽기 차단

```javascript
// hooks/read_hook.js
async function main() {
  const chunks = [];
  for await (const chunk of process.stdin) {
    chunks.push(chunk);
  }

  const toolArgs = JSON.parse(Buffer.concat(chunks).toString());
  const readPath =
    toolArgs.tool_input?.file_path || toolArgs.tool_input?.path || "";

  if (readPath.includes(".env")) {
    console.error("You cannot read the .env file");
    process.exit(2);  // 차단
  }
  process.exit(0);    // 진행
}

main();
```

### V-4-g. Gotchas

- **상대 경로 금지** — 팀 공유 시 경로 다름·경로 탈취·바이너리 심기 위험
- **절대 경로 사용** — `$CLAUDE_PROJECT_DIR` 또는 `$PWD` 자리표시자 + setup 스크립트로 변환
- **`settings.example.json`** (커밋) → `init-claude.js` 변환 → `settings.local.json` (`.gitignore`)

### V-4-h. 유용한 Hook 패턴

1. **TypeScript 타입 검사** — `PostToolUse` (Edit|Write) → `tsc --noEmit` → stderr로 에러 피드백
2. **쿼리 중복 방지** — `PostToolUse` (`./queries/*` 변경) → 별도 Claude 인스턴스로 중복 검사
3. **자동 포맷팅** — `PostToolUse` (Edit|Write) → `prettier --write`
4. **민감 파일 보호** — `PreToolUse` (Read|Grep) → `.env`/`.aws` 등 차단
5. **로깅·감사** — 모든 `PostToolUse`에서 `jq . > audit.log`

### V-4-i. 디버깅

전체 stdin 내용을 파일로 저장:

```json
"PostToolUse": [
  {
    "matcher": "*",
    "hooks": [
      { "type": "command", "command": "jq . > post-log.json" }
    ]
  }
]
```

훅 발동 시 `post-log.json`에 입력 데이터 구조 확인 → 조건 검사 로직 작성.

---

# Part VI. AI Fluency 응용 — Educators · Students · Teaching

## VI-1. AI Fluency for Educators

> **출처**: AI Fluency for Educators 01–04

**핵심**

- 4D 프레임워크는 교육 실무의 사고 파트너십에 직접 적용 가능
- AI는 교수 역량 **대체가 아닌 강화**
- **Teaching Context Document** — 교육 철학·제약·학생 특성을 담은 공유 문서. 일반적 AI를 교육자 맞춤형으로 변환
- **Augmentation > Automation** — 학습 맥락에서는 협업이 더 가치 있음

**적용 영역**

1. **Course Design / Learning Outcomes** — 4D 체계적 적용 (위임: 계획 범위 결정, 설명: 풍부한 맥락, 식별: 비판 평가, 성실: 협업 문서화)
2. **Learning Materials / Assignments** — Description-Discernment 루프로 자료 지속 개선, 일관된 학습 경험 창출

**원문 인용**: *"The goal is enhancement, not just efficiency. We want better teaching and learning, not just faster planning."*

---

## VI-2. AI Fluency for Students

> **출처**: AI Fluency for Students 01–05

**핵심**

- AI 유창함 = 일시적 팁이 아닌 **지속 가능한 원칙**
- **Learning Context Document** — 학습 목표·도전 과제·AI 활용 경계 작성
- **AI Learning Partner** — AI를 직접 답을 주는 도구가 아닌 **튜터·코치**로 설정 (질문·피드백 통한 학습 유도)
- **Living Learning Journal** — 지속적 학습 추적·반성

**진로 계획 (career planning)**

- 정보 수집·기술 개발에는 AI 활용
- **이력서·자기소개서**는 자동 생성 거부 — 자신의 목소리·경험 유지
- **AI 유창함 자체가 직업 가치** — 면접에서 진정성 있게 언급

**Human in the Loop**

- 의사결정·창의·윤리는 인간이 보유
- 개인 AI 협업 정책 수립 권고

**원문 인용**: *"Your humanity—your specific talents, experiences, and perspectives—remains uniquely valuable and irreplaceable."*

---

## VI-3. Teaching AI Fluency

> **출처**: Teaching AI Fluency 01–07

### 4가지 교수 접근법

| 접근 | 적합 학생 |
|---|---|
| **Linear** (순차) | 구조 필요 초보자 |
| **Non-linear** (유연) | AI 경험자 |
| **Focused** (심화) | 한 D를 깊게 |
| **Two-loops** (순환) | 복잡한 실제 업무 |

### Two Loops

- **Delegation-Diligence Loop** — 거시 전략·윤리
- **Description-Discernment Loop** — 미시 협업 환경

### 평가 (4D Assessment)

3가지 접근의 조합:

1. **Outcome-based** — 산출물 품질
2. **Process-based** — 협업 과정·의사결정 검증
3. **Reflection-based** — 메타인지 평가

### 과제 설계 3원칙

1. **Authenticity** — 실제 협업 반영
2. **Iteration** — 반복 통한 성장 증거
3. **Pedagogical Transparency** — 협업 과정 평가 가시화

### 분야 전문성 통합

- **Tacit knowledge externalization** — 분야의 암묵적 지식(품질·소통·윤리·작업 분해)을 명시화
- 학생이 분야 기준을 체득해야 어떤 AI 협업에서도 인간 가치 유지

**원문 인용**: *"The goal is preparing students to be irreplaceable by developing uniquely human capabilities."*

---

# 부록 A. 용어 사전

| 한국어 | 영문 | 정의 |
|---|---|---|
| 에이전트 루프 | Agentic loop | Prompt → Context → Action → Verify 반복 |
| 컨텍스트 윈도우 | Context window | 한 번에 처리 가능한 토큰 상한 |
| 압축 | Compaction | 컨텍스트 한도 도달 시 자동 요약 |
| 도구 사용 | Tool use | LLM이 형식화된 텍스트로 도구 호출 |
| 환각 | Hallucination | AI가 사실과 무관한 정보 생성 |
| 지식 컷오프 | Knowledge cutoff | 학습 데이터 종료 시점 |
| 사전훈련 | Pre-training | 대규모 패턴 학습 단계 |
| 미세조정 | Fine-tuning | 명령 따르기 조정 단계 |
| 트랜스포머 | Transformer | Self-attention 기반 LLM 아키텍처 |
| 위임 | Delegation | 4D — 무엇을 AI에 맡길지 결정 |
| 설명 | Description | 4D — AI에 의도 전달 |
| 식별 | Discernment | 4D — 출력 비판 평가 |
| 성실 | Diligence | 4D — 책임감 있는 실행 |
| 자동화 | Automation | AI가 정해진 작업 수행 |
| 증강 | Augmentation | 인간-AI 창의적 협업 |
| 자율성 | Agency | AI 자율 작동, 인간이 지식·행동 형성 |
| 계획 모드 | Plan Mode | 읽기 전용 도구로 계획 수립 |
| 사고 모드 | Thinking Mode | 추론 강화 (Think/Ultrathink) |
| 서브에이전트 | Subagent | 격리 컨텍스트 워커 |
| 스킬 | Skill (Agent Skill) | lazy-loaded 절차 지식 (SKILL.md) |
| 모델 컨텍스트 프로토콜 | MCP (Model Context Protocol) | 외부 도구·데이터 표준 프로토콜 |
| 훅 | Hook | 라이프사이클 이벤트 결정론적 실행 |
| 점진적 공개 | Progressive disclosure | 필요시에만 상세 자료 로드 |
| 검색 증강 생성 | RAG (Retrieval Augmented Generation) | 컨텍스트 한계 시 자동 검색 모드 |
| 헌법적 AI | Constitutional AI | 인간 가치 정렬 학습 원칙 |

---

# 부록 B. 도구 결정 가이드

## "이 작업은 어디에 인코딩해야 하나?"

```
질문 1: 이 작업이 매번 일관되게 발생해야 하는가?
  YES → 자동화 필요 → 질문 2로
  NO  → 프롬프트로 충분

질문 2: 외부 도구·데이터에 접근하는가?
  YES → MCP 서버
  NO  → 질문 3으로

질문 3: 라이프사이클 이벤트(파일 저장·도구 호출 등)에 반응하는가?
  YES → Hook
  NO  → 질문 4로

질문 4: 격리된 컨텍스트가 필요한가? (탐색·리뷰)
  YES → Subagent
  NO  → 질문 5로

질문 5: 의도 매칭으로 자동 트리거하고 싶은가?
  YES → Skill (요청 의도와 description 매칭)
  NO  → Slash command (`.claude/commands/<name>.md`)

질문 6: 프로젝트 전체 표준인가? (항상 로드)
  YES → CLAUDE.md
```

## 비교 표

| 기능 | 트리거 | 컨텍스트 | 상태 | 영구성 |
|---|---|---|---|---|
| **CLAUDE.md** | 자동 (모든 세션) | 메인 | 매 세션 | git |
| **Slash command** | 사용자 `/<name>` | 메인 | 매 호출 | `.claude/commands/` |
| **Skill** | 의도 매칭 (lazy) | 메인 | 매 호출 | `.claude/skills/` 또는 `~/.claude/skills/` |
| **Subagent** | 메인이 위임 | 격리 | 위임 시 | `.claude/agents/` 또는 `~/.claude/agents/` |
| **MCP server** | 클라이언트 연결 | 도구 정의 매 세션 로드 | 서버 프로세스 | `.mcp.json` 또는 user/local |
| **Hook** | 라이프사이클 이벤트 | 별도 프로세스 | 이벤트 발생 시 | `settings.json` |

---

# 부록 C. 명령어 치트시트

## Claude Code 인터랙티브 명령

| 명령 | 용도 |
|---|---|
| `Shift+Tab` | 모드 전환 (Approval / Auto-accept / Plan Mode) |
| `Ctrl+V` | 스크린샷·이미지 붙여넣기 (Mac도 동일) |
| `Esc` | 응답 중단 |
| `Esc` × 2 | 과거 메시지로 되감기 |
| `@<path>` | 파일 콘텐츠 자동 포함 |
| `#<text>` | 메모리 모드 (CLAUDE.md 저장) |

## Slash Commands (내장)

| 명령 | 용도 |
|---|---|
| `/init` | CLAUDE.md 자동 생성 |
| `/compact` | 대화 요약 압축 |
| `/clear` | 히스토리 완전 제거 |
| `/context` | 컨텍스트 사용량 분석 |
| `/agents` | 서브에이전트 생성·관리 |
| `/mcp` | MCP 서버 관리 |
| `/hooks` | Hook 대화형 구성 |
| `/install-github-app` | GitHub Actions 설치 |

## Bash 명령

```bash
# 설치
curl -fsSL https://claude.ai/install.sh | bash
brew install --cask claude-code   # macOS, auto-update 미지원

# 실행·재개
claude
claude --from-pr 123   # PR 작업 재개
claude --debug         # 디버그 출력

# MCP
claude mcp add <name>           # HTTP 또는 stdio 서버 추가
claude mcp add <name> <command> # stdio 명시
mcp dev <server.py>             # MCP Server Inspector
```

## Cowork 명령

| 명령 | 용도 |
|---|---|
| `/schedule` | 스케줄 작업 설정 |

---

# 부록 D. 원본 레슨 인덱스

> 11개 코스 / 106 레슨 → 본 문서 섹션 매핑. (Quiz/Survey/Certificate 11개는 원본에서도 스킵.)

## D-1. AI Fluency Framework Foundations (14)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | Introduction to AI Fluency | [II 개요](#part-ii-올바른-사용--4d-framework) |
| 02 | Why do we need AI Fluency? | [I-3](#i-3-ai와-사람의-협업-양상--automation--augmentation--agency) |
| 03 | The 4D Framework | [II 개요](#part-ii-올바른-사용--4d-framework) |
| 04 | Generative AI fundamentals | [I-1](#i-1-generative-ai-기초-generative-ai-fundamentals) |
| 05 | Capabilities & limitations | [I-2](#i-2-capabilities--limitations) |
| 06 | A closer look at Delegation | [II-1](#ii-1-delegation--무엇을-ai에-맡길-것인가) |
| 07 | Project planning and Delegation | [II-1](#ii-1-delegation--무엇을-ai에-맡길-것인가) |
| 08 | A closer look at Description | [II-2](#ii-2-description--효과적-프롬프트-기법) |
| 09 | Effective prompting techniques | [II-2](#ii-2-description--효과적-프롬프트-기법) |
| 10 | A closer look at Discernment | [II-3](#ii-3-discernment--출력-비판적-평가) |
| 11 | The Description-Discernment loop | [II-5](#ii-5-description-discernment-loop) |
| 12 | A closer look at Diligence | [II-4](#ii-4-diligence--책임감-있는-사용) |
| 13 | Conclusion | [II 개요](#part-ii-올바른-사용--4d-framework) |
| 15 | Additional activities | [II 개요](#part-ii-올바른-사용--4d-framework) |

## D-2. Claude 101 (13)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | What is Claude? | [I-2](#i-2-capabilities--limitations) |
| 02 | Your first conversation with Claude | [II-2](#ii-2-description--효과적-프롬프트-기법) |
| 03 | Getting better results | [II-2](#ii-2-description--효과적-프롬프트-기법), [II-3](#ii-3-discernment--출력-비판적-평가) |
| 04 | Claude desktop app: Chat, Cowork, Code | [III-1](#iii-1-claude-desktop-app-3가지-모드-비교) |
| 05 | Introduction to projects | [III-2](#iii-2-projects-지속-작업의-워크스페이스) |
| 06 | Creating with artifacts | [III-3](#iii-3-artifacts-산출물-생성편집) |
| 07 | Working with skills | [III-4](#iii-4-skills-on-claudeai), [V-2](#v-2-skills-agent-skills) |
| 08 | Connecting your tools | [III-5](#iii-5-connectors--enterprise-search) |
| 09 | Enterprise search | [III-5](#iii-5-connectors--enterprise-search) |
| 10 | Research mode for deep dives | [III-6](#iii-6-research-mode-심층-조사) |
| 11 | Claude in action: use-cases by role | [III-1](#iii-1-claude-desktop-app-3가지-모드-비교) (개관) |
| 12 | Other ways to work with Claude | [III-1](#iii-1-claude-desktop-app-3가지-모드-비교) |
| 13 | What's next? | (학습 정리) |

## D-3. Claude Code 101 (12)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | What is Claude Code | [IV-1](#iv-1-정의아키텍처설치) |
| 02 | How Claude Code works | [IV-1](#iv-1-정의아키텍처설치) |
| 03 | Installing Claude Code | [IV-1](#iv-1-정의아키텍처설치) |
| 04 | Your first prompt | [IV-2](#iv-2-핵심-워크플로--explore--plan--code--commit) |
| 05 | The explore → plan → code → commit workflow | [IV-2](#iv-2-핵심-워크플로--explore--plan--code--commit) |
| 06 | Context management | [IV-3](#iv-3-context-management) |
| 07 | Code review | [IV-5](#iv-5-code-review-서브에이전트-활용) |
| 08 | The CLAUDE.md file | [IV-4](#iv-4-claudemd--프로젝트-지침-파일) |
| 09 | Subagents | [V-1](#v-1-subagents) |
| 10 | Skills | [V-2](#v-2-skills-agent-skills) |
| 11 | MCP | [V-3](#v-3-mcp-model-context-protocol) |
| 12 | Hooks | [V-4](#v-4-hooks) |

## D-4. Claude Code in Action (19)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | Introduction | [Part IV 개요](#part-iv-claude-code-본체) |
| 02 | What is a coding assistant | [IV-1](#iv-1-정의아키텍처설치) |
| 03 | Claude Code in action | [IV-1](#iv-1-정의아키텍처설치) |
| 04 | Claude Code setup | [IV-1](#iv-1-정의아키텍처설치) |
| 05 | Project setup | (실습 환경 안내) |
| 06 | Adding context | [IV-4](#iv-4-claudemd--프로젝트-지침-파일), [IV-9](#iv-9-adding-context--스크린샷thinking-modes) |
| 07 | Making changes | [IV-9](#iv-9-adding-context--스크린샷thinking-modes) |
| 09 | Controlling context | [IV-3](#iv-3-context-management) |
| 10 | Custom commands | [IV-6](#iv-6-custom-commands--slash-commands) |
| 11 | MCP servers with Claude Code | [V-3](#v-3-mcp-model-context-protocol) |
| 12 | GitHub integration | [IV-7](#iv-7-github-integration) |
| 13 | Introducing hooks | [V-4](#v-4-hooks) |
| 14 | Defining hooks | [V-4](#v-4-hooks) |
| 15 | Implementing a hook | [V-4](#v-4-hooks) |
| 16 | Gotchas around hooks | [V-4-g](#v-4-g-gotchas) |
| 17 | Useful hooks! | [V-4-h](#v-4-h-유용한-hook-패턴) |
| 18 | Another useful hook | [V-4](#v-4-hooks) |
| 19 | The Claude Code SDK | [IV-8](#iv-8-claude-code-sdk) |
| 21 | Summary and next steps | (정리) |

## D-5. Introduction to Claude Cowork (10)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | What is Cowork | [III-1](#iii-1-claude-desktop-app-3가지-모드-비교), [III-7](#iii-7-claude-cowork-심화) |
| 02 | Getting set up | [III-7](#iii-7-claude-cowork-심화) |
| 03 | The task loop | [III-7-a](#iii-7-a-task-loop-cowork_03) |
| 04 | Giving Cowork context | [III-7-b](#iii-7-b-context-cowork_04) |
| 05 | Plugins: Cowork as a specialist | [III-7-c](#iii-7-c-plugins-cowork_05) |
| 06 | Scheduled tasks | [III-7-d](#iii-7-d-scheduled-tasks-cowork_06) |
| 07 | File & document tasks | [III-7-e](#iii-7-e-file--document-tasks-cowork_07) |
| 08 | Research & analysis at scale | [III-7-f](#iii-7-f-research--analysis-at-scale-cowork_08) |
| 09 | Permissions, usage, & choosing your model | [III-7-g](#iii-7-g-permissionsusagemodel-cowork_09) |
| 10 | Troubleshooting & next steps | [III-7](#iii-7-claude-cowork-심화) |

## D-6. Introduction to Agent Skills (6)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | What are skills | [V-2-a](#v-2-a-정의) |
| 02 | Creating your first skill | [V-2-c](#v-2-c-skillmd-구조) |
| 03 | Configuration and multi-file skills | [V-2-d](#v-2-d-디렉토리--다중-파일) |
| 04 | Skills vs. other Claude Code features | [V-2-e](#v-2-e-skills-vs-다른-기능), [부록 B](#부록-b-도구-결정-가이드) |
| 05 | Sharing skills | [V-2-f](#v-2-f-공유) |
| 06 | Troubleshooting skills | [V-2-g](#v-2-g-트러블슈팅) |

## D-7. Introduction to Subagents (4)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | What are subagents | [V-1-a](#v-1-a-정의) |
| 02 | Creating a subagent | [V-1-b](#v-1-b-생성-agents-명령), [V-1-c](#v-1-c-frontmatter-형식) |
| 03 | Designing effective subagents | [V-1-d](#v-1-d-효과적-설계), [V-1-e](#v-1-e-출력-구조-예시) |
| 04 | Using subagents effectively | [V-1-f](#v-1-f-언제-쓰는가) |

## D-8. Introduction to Model Context Protocol (12)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | Welcome to the course | [V-3](#v-3-mcp-model-context-protocol) |
| 02 | Introducing MCP | [V-3-a](#v-3-a-정의), [V-3-b](#v-3-b-아키텍처) |
| 03 | MCP clients | [V-3-b](#v-3-b-아키텍처) |
| 04 | Project setup | (개발 환경) |
| 05 | Defining tools with MCP | [V-3-d](#v-3-d-tool-정의-python-sdk) |
| 06 | The server inspector | [V-3-g](#v-3-g-server-inspector-개발-디버깅) |
| 08 | Implementing a client | [V-3-b](#v-3-b-아키텍처) |
| 09 | Defining resources | [V-3-e](#v-3-e-resource-정의-direct--templated) |
| 10 | Accessing resources | [V-3-e](#v-3-e-resource-정의-direct--templated) |
| 11 | Defining prompts | [V-3-f](#v-3-f-prompt-정의) |
| 12 | Prompts in the client | [V-3-f](#v-3-f-prompt-정의) |
| 14 | MCP review | [V-3-c](#v-3-c-3가지-원시-타입-primitives) |

## D-9. AI Fluency for Educators (4)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | Introduction to AI Fluency for Educators | [VI-1](#vi-1-ai-fluency-for-educators) |
| 02 | AI Fluency Framework review | [VI-1](#vi-1-ai-fluency-for-educators), [Part II](#part-ii-올바른-사용--4d-framework) |
| 03 | Applying AI Fluency to course design and learning outcomes | [VI-1](#vi-1-ai-fluency-for-educators) |
| 04 | Applying AI Fluency to learning materials and assignments | [VI-1](#vi-1-ai-fluency-for-educators) |

## D-10. AI Fluency for Students (5)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | Welcome to AI Fluency for students | [VI-2](#vi-2-ai-fluency-for-students) |
| 02 | AI Fluency Framework | [VI-2](#vi-2-ai-fluency-for-students), [Part II](#part-ii-올바른-사용--4d-framework) |
| 03 | AI as a learning partner | [VI-2](#vi-2-ai-fluency-for-students) |
| 04 | AI in career planning | [VI-2](#vi-2-ai-fluency-for-students) |
| 05 | Being the human in the loop | [VI-2](#vi-2-ai-fluency-for-students), [II-4](#ii-4-diligence--책임감-있는-사용) |

## D-11. Teaching AI Fluency (7)

| # | 영문 제목 | 본 문서 매핑 |
|---|---|---|
| 01 | Welcome & approaches to teaching AI Fluency | [VI-3](#vi-3-teaching-ai-fluency) |
| 02 | The Delegation-Diligence loop | [VI-3](#vi-3-teaching-ai-fluency), [II-5](#ii-5-description-discernment-loop) |
| 03 | The Description-Discernment loop | [VI-3](#vi-3-teaching-ai-fluency), [II-5](#ii-5-description-discernment-loop) |
| 04 | How do we assess the 4Ds | [VI-3](#vi-3-teaching-ai-fluency) |
| 05 | Designing assignments for AI Fluency | [VI-3](#vi-3-teaching-ai-fluency) |
| 06 | AI's impact and your discipline | [VI-3](#vi-3-teaching-ai-fluency) |
| 07 | Applying discipline expertise to AI Fluency | [VI-3](#vi-3-teaching-ai-fluency) |

---

**문서 끝**. 총 11개 코스 / 106개 레슨 통합. 부록 D로 원본 ↔ 본 문서 양방향 추적 가능.
