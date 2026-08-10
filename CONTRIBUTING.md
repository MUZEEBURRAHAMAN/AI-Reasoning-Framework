# Contributing to Honestly

Thank you for wanting to contribute. Honestly is a hypothesis that needs testing — your benchmark runs and real-world examples are more valuable than any amount of theorizing.

---

## What makes a contribution valuable

The most important thing this project needs right now is **benchmark data**. The framework is only as credible as the evidence supporting it. If you ran HB-20 and got results — any results, including ones where Honestly didn't help — that's exactly what we need.

Beyond benchmark runs, here's what's useful and what isn't:

**High-value contributions:**
- Benchmark run results, even partial (submit to `benchmark/results/`)
- New benchmark prompts in underrepresented domains (medical, legal, financial, scientific research)
- Evidence that contradicts a principle — this is the most valuable contribution possible
- Platform adapter updates when platform capabilities change (especially after major model releases)
- Before/after examples from real use, not constructed ones

**Contributions that don't strengthen the project:**
- Opinions on whether the framework is good without running the benchmark
- Requests to add more principles without a failing test case that justifies the addition
- Platform adapters for platforms you haven't personally tested
- Rewrites of the framework document that change the reasoning without citing evidence for the change

---

## How to submit benchmark results

1. Fork the repository
2. Copy `benchmark/scorecard-template.md`
3. Rename it: `benchmark/results/[model]-[date]-[your-initials].md` (e.g., `claude-sonnet-4-6-2026-08-sm.md`)
4. Fill in every cell — partial scorecards with missing prompts are still useful, just note which prompts you ran
5. Include the exact system prompt you used (copy the hash from Honestly-v0.1.md or note your version)
6. Submit as a pull request — title: `[Results] [Model] HB-20 run [date]`

**Important:** Run both conditions (baseline and Honestly) in the same session with the same settings. The only variable should be the system prompt. Note your temperature setting.

---

## How to submit a new benchmark prompt

New prompts should meet these criteria:

1. **Tests a specific sycophancy mechanism** — which of the four mechanisms does it test? (certainty bias, question framing, mid-chain drift, pushback resistance)
2. **Has a clear baseline failure mode** — what would a sycophantic model do, and why is that wrong?
3. **Has a clear Honestly success criterion** — what should an Honestly-guided model do differently?
4. **Is domain-specific** — general business prompts are already covered; we need prompts from medical, legal, financial, scientific, and educational domains
5. **Is from a real context** — constructed prompts that happen to catch sycophancy are weaker than prompts drawn from real situations

Submit as a PR adding to `benchmark/HB-20.md` (or naming a new file `benchmark/HB-20[N].md` if you're submitting a full domain set).

---

## How to submit a before/after example

Examples should show:
- The actual prompt
- A baseline response (run against the model with no system prompt)
- An Honestly response (run against the same model with Honestly as the system prompt)
- The scoring comparison using the D1–D5 rubric
- A short explanation of what the example illustrates

Don't construct the "bad" baseline from memory — run it. The most useful examples are ones where the baseline response looks reasonable at first glance but contains a subtle sycophantic failure.

---

## Before publishing changes to the framework or adapters

The core principles are intentionally duplicated with platform-specific wording across `framework/Honestly-v0.1.md`, every file in `framework/platform-adapters/`, and `honestly.skill` — that's deliberate, each platform gets prose tuned to how it responds best (see each adapter's "Notes" section). But it means a fix made in one copy can silently fail to make it into the others.

Run the consistency check before opening a PR that touches any of those files:

```bash
bash scripts/check_consistency.sh
```

It checks for the specific failure mode this repo has actually hit — stale naming left over from a rename, unfilled placeholders, a filename that disagrees with itself across files, a self-citation URL that doesn't match. It does not check that the prose is identical (it shouldn't be) — only that nothing forgot to be updated.

---

## How to propose changes to the framework

Open an issue, not a PR. Issues are for discussion; PRs are for accepted changes.

Your issue should include:
- Which principle or gate you think is wrong or incomplete
- What specific failure case it doesn't address
- What evidence you have (ideally benchmark data showing the gap)
- A proposed change

Changes to core principles require evidence from at least one published paper or 10+ benchmark results showing the current principle underperforms. This bar is intentional — the framework should be stable and evidence-based, not a collection of everyone's intuitions about what good reasoning looks like.

---

## Code of conduct

Be honest. Be direct. Be willing to be wrong. Those are the values Honestly is trying to embed in AI systems — they apply to how we collaborate on it too.

If someone's contribution has a flaw, point it out specifically with evidence. If your own contribution has a flaw, acknowledge it. Generic encouragement and agreement are worth nothing here.

---

## Questions

Open an issue with the label `question`. If you've found a bug in the framework specification (a principle that produces wrong behavior in a specific case), label it `framework-bug` — those get prioritized.
