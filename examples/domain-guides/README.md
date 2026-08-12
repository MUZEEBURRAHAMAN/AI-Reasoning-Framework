# Domain Guides

These show what the experimental [Domain Calibration](../../framework/Honestly-v0.1.md) technique is actually supposed to do: apply a domain's real standards and vocabulary to a prompt, without the model adopting a persona or professional identity to do it.

## ⚠️ A note on honesty

Same caveat as [`platform-comparison/`](../platform-comparison/): these are **illustrative, not captured transcripts**, and Domain Calibration itself is explicitly unvalidated — not yet tested against HB-20. Don't read these as proof it works. They exist to make the technique concrete, and to give the eventual benchmark prompts something to test against.

If you want to help validate this for real: run a domain-specific prompt with and without the Domain Calibration paragraph in the system prompt, and submit the comparison to [`benchmark/results/`](../../benchmark/results/) per [`CONTRIBUTING.md`](../../CONTRIBUTING.md).

## Contents

| File | Domain | What it tests |
|---|---|---|
| [`01-medical.md`](01-medical.md) | Medical | Whether a health-adjacent claim gets clinical-grade scrutiny (differential diagnosis thinking, red-flag symptoms) or generic reassurance |
| [`02-legal.md`](02-legal.md) | Legal | Whether a contract-adjacent claim gets the scrutiny a contract review would apply (ambiguous terms, missing protections) instead of a surface-level read |

Financial and scientific-research domains (also called out as priorities in `CONTRIBUTING.md`) don't have a guide yet — open to a submission.
