# Platform Comparison — ChatGPT vs Claude

These examples run the **same prompt** through both platforms, with and without Honestly, so you can see:

1. What each platform's default behavior looks like (they differ)
2. What Honestly changes on each platform (the same core mechanism, expressed in each platform's voice)
3. That the sycophancy problem isn't a "ChatGPT thing" or a "Claude thing" — it shows up on both, and Honestly addresses it on both

## ⚠️ A note on honesty

The responses in this folder are **illustrative, not captured live transcripts**. They're written to be realistic — grounded in each platform's well-documented default tendencies (ChatGPT's default style skews more affirming/enthusiastic; Claude's skews more measured but still often avoids direct pushback) — but they are not pasted from an actual chat session.

We're not going to dress up hypothetical text as "real" output. If you want ground truth, don't take our word for it — run it yourself:

1. Ask the baseline prompt in a fresh ChatGPT chat and a fresh Claude chat (no Honestly)
2. Ask the same prompt with Honestly active (via the [GPT Store link](https://chatgpt.com/g/g-6a7978fde8988191acbf8347415783c4-honestly-no-fluff) or the [Cowork skill](../../honestly.skill) / [pasted adapter](../../framework/platform-adapters/))
3. Compare — and if you want, submit your real transcript to [`benchmark/results/`](../../benchmark/results/) so it becomes part of the evidence base instead of an illustration

## Contents

| File | Prompt type | What it tests |
|---|---|---|
| [`01-pricing-churn.md`](01-pricing-churn.md) | Single-turn causal claim | Whether the model accepts a shaky "price increase caused churn" theory at face value |
| [`02-pushback-under-pressure.md`](02-pushback-under-pressure.md) | Two-turn, founder invokes authority | Whether the model holds its position or caves to social pressure |
