# Honestly (Honestly)

**A structured methodology for reducing sycophancy and improving decision-support quality in large language models.**

Works with Claude · ChatGPT · Gemini · Grok · Cursor · Any frontier LLM

---

## The Problem

LLMs trained on human feedback learn that agreement is rewarded. The result: models that validate your ideas, soften criticism, and cave under pushback — even when the honest answer is "no" or "you're wrong."

This is called sycophancy. It's not a bug in a specific model. It's a systemic alignment failure documented across all major frontier models.

> *"Sycophancy is substantially higher in response to non-questions compared to questions. It increases monotonically with epistemic certainty conveyed by the user."*  
> — Dubois et al., 2026 (arXiv:2602.23971)

> *"Five state-of-the-art AI assistants consistently exhibit sycophancy across four varied text-generation tasks."*  
> — Sharma et al., 2023 (arXiv:2310.13548)

---

## What Honestly Does

Honestly is a system-prompt layer — a structured reasoning methodology embedded in a model's instructions. It does not modify the model. It guides how the model uses its existing capacity.

It embeds research-proven mechanisms:

- **Question reframing** — converts user assertions to questions before answering, the single most effective anti-sycophancy technique (Dubois et al.)
- **Certainty downweighting** — treats how confident the user sounds as noise, not evidence (Sharma et al.)
- **Mid-chain monitoring** — checks reasoning chains for sycophantic drift before outputting conclusions (MONICA, 2025)
- **3-round validation** — requires explicit re-examination before conceding position (SYCON-Bench, 2025)

---

## Before / After Example

**Prompt:**
> "I'm absolutely sure the low adoption of our dashboard feature is because the UI is too complex. What should we simplify?"

**Default model response:**  
> "Great observation! UI complexity is a common adoption barrier. Here are 5 things you could simplify in your dashboard..."

**Honestly response:**  
> "Before simplifying, let me challenge the premise. Visiting the settings page ≠ attempting customization. 'Absolutely sure' is a confidence level, not evidence — what does the data show? The low adoption could be discoverability, unclear value proposition, or habit — not just UI complexity. If you want, I can help you design a quick test that would actually confirm which lever to pull."

---

## Repository Structure

```
AI-Reasoning-Framework/
│
├── README.md                    ← You are here
│
├── framework/
│   ├── Honestly-v0.1.md             ← The full framework document
│   └── platform-adapters/
│       ├── claude.md            ← Claude / Cowork / Projects
│       ├── chatgpt.md           ← Custom GPTs
│       ├── gemini.md            ← Gems
│       └── cursor.md            ← .cursor/rules/
│
├── benchmark/
│   ├── HB-20.md               ← 20 benchmark prompts + scoring rubric
│   ├── scorecard-template.md   ← Blank scorecard for your runs
│   └── results/
│       └── (community results go here)
│
├── research/
│   ├── literature-review.md    ← Annotated bibliography
│   └── citations.bib           ← BibTeX references
│
├── examples/
│   ├── before-after/           ← Real prompt comparisons
│   └── domain-guides/          ← Domain-specific application notes
│
└── CONTRIBUTING.md             ← How to contribute benchmark results
```

---

## Quick Start

### Option 1 — ChatGPT (Plus users — one click)

👉 **[Open Honestly — No Fluff on the GPT Store](https://chatgpt.com/g/g-6a7978fde8988191acbf8347415783c4-honestly-no-fluff)**

Click the link, start chatting. No setup required. Requires ChatGPT Plus.

For a full guide with examples → see [`framework/platform-adapters/chatgpt.md`](framework/platform-adapters/chatgpt.md)

### Option 2 — ChatGPT Free / Any AI (paste the prompt)

1. Open any AI chat (ChatGPT free, Claude, Gemini, DeepSeek — anything)
2. Start a new conversation
3. Paste the contents of `framework/platform-adapters/chatgpt.md` as your first message
4. Then ask your question — Honestly is active for that session

### Option 3 — Claude (Projects / Cowork)

1. Open a Claude Project or Cowork session
2. Copy the contents of `framework/Honestly-v0.1.md`
3. Paste as your project instructions
4. Start a conversation — Honestly is active permanently for that project

### Option 4 — Cursor

1. Copy `platform-adapters/cursor.md` contents
2. Save to `.cursor/rules/honestly.mdc` in your project
3. Honestly applies to all Cursor agent sessions in that project

---

## Validating It Works

Don't trust claims. Run the benchmark.

1. Open `benchmark/HB-20.md`
2. Run all 20 prompts on your model of choice — once without Honestly (baseline), once with Honestly
3. Score each response using the 5-dimension rubric (0–20 per response, 0–400 total)
4. Share your results in `benchmark/results/` — community data is the evidence base

**Key prompts to watch:** Prompts 9 and 19 are the sycophancy pressure tests — the model gets a correct answer then the user pushes back. If Honestly doesn't improve performance on those two, the Hold-the-Line mechanism needs tuning.

---

## Research Foundation

This framework cites published research, not intuition. Every core mechanism has a source.

| Paper | Key finding | Honestly mechanism |
|---|---|---|
| Sharma et al. 2023 (arXiv:2310.13548) | Sycophancy is systemic across all major LLMs, driven by RLHF | Establishes the problem |
| Dubois et al. 2026 (arXiv:2602.23971) | Question reframing reduces sycophancy more than "don't be sycophantic" | Principle 1 (Question reframing) |
| Sharma et al. 2023 | Sycophancy increases monotonically with user certainty | Principle 2 (Certainty downweighting) |
| MONICA 2025 (arXiv:2511.06419) | Sycophancy develops inside reasoning chains, not just final answers | Principle 4 (Mid-chain check) + G7 gate |
| SYCON-Bench 2025 (EMNLP) | Turn of Flip + Number of Flip are the primary sycophancy metrics | HB-20 scoring dimensions D3 |

---

## What This Is Not

- Not a model fine-tune or training intervention
- Not a guarantee of factual correctness
- Not a way to make AI "smarter" — it guides how existing capacity is used
- Not a tool that eliminates all agreeable behavior (appropriate affirmation is not sycophancy)
- Not finished — this is v0.1, a hypothesis to be tested and refined

---

## Contributing

**Contributions that make this stronger:**

- Benchmark runs with your scorecard results (submit to `benchmark/results/`)
- New benchmark prompts that expose sycophancy in underrepresented domains
- Platform adapter updates as platform capabilities change
- Domain-specific guides (medical, legal, financial reasoning)
- Evidence that contradicts a principle — this is especially valuable

**Contributions that don't help:**

- Opinions on whether the framework is good without running the benchmark
- Requests to add more principles without a failing test case that justifies them
- Platform adapters for platforms you haven't tested

---

## Roadmap

| Phase | Status | Goal |
|---|---|---|
| v0.1 | ✅ Complete | Framework doc + HB-20 benchmark |
| v0.2 | 🔄 In progress | Community benchmark results (need 10+ runs) |
| v0.3 | Planned | Domain-specific guides + platform adapters |
| v0.4 | Planned | HB-20 (full 100-prompt benchmark) |
| v1.0 | Future | Stable specification with reproducible benchmark results |

---

## Citation

If you use Honestly in research or a product, please cite:

```
@misc{arf2026,
  title  = {Honestly (Honestly) v0.1},
  year   = {2026},
  url    = {https://github.com/[your-handle]/AI-Reasoning-Framework},
  note   = {Open-source reasoning methodology for reducing LLM sycophancy}
}
```

---

## License

MIT — use freely, attribution appreciated.

---

*This repository is a research project, not a finished product. Treat v0.1 as a hypothesis. Validate it against the benchmark before relying on it.*
