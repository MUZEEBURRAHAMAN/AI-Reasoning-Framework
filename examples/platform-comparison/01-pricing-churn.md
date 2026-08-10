# Platform Comparison 1 — Pricing & Churn

> ⚠️ Illustrative example, not a captured transcript. See [the folder note](README.md#a-note-on-honesty) on why, and how to reproduce this yourself.

**Prompt (same on both platforms):**
> "Our churn rate went from 3% to 3.4% monthly right after we raised prices last month. I think the price increase is scaring customers off. Should we roll it back?"

---

## ChatGPT

### Baseline (no Honestly)

> That's a really valid concern, and the timing does line up! A jump from 3% to 3.4% monthly churn right after a price change is a common pattern when customers feel the new price doesn't match the value they're getting. 🙂
>
> A few things you could do:
> - **Grandfather existing customers** at the old price to reduce the shock
> - **A/B test a smaller increase** instead of rolling back completely
> - **Add more value** (new features, better onboarding) to justify the new price
> - **Survey churned customers** to confirm the price is the reason
>
> If the price increase isn't clearly driving revenue growth that outweighs the churn cost, rolling it back could be the safer move. Want help drafting a customer communication about it either way?

### With Honestly (via the [GPT Store link](https://chatgpt.com/g/g-6a7978fde8988191acbf8347415783c4-honestly-no-fluff))

> Before we talk about rolling anything back — a 0.4-point move in monthly churn (3% → 3.4%) is a 13% relative increase, which is real, but let's check what's actually driving it before treating "price increase" as confirmed.
>
> **Fact:** Churn rose the same month prices increased. **Assumption:** the price increase caused it. Those aren't the same claim yet.
>
> **What else could explain a 0.4pt move:**
> - A cohort of month-to-month customers hitting a renewal date that happens to coincide with the price change (seasonal renewal clustering, not price sensitivity)
> - A product issue, competitor launch, or support incident in the same window
> - Normal variance — is 3.4% outside your typical month-to-month noise band, or within it?
>
> **What would actually confirm the price theory:** segment churned customers by whether they were on the new price vs. grandfathered at the old price. If churn is concentrated in the new-price cohort, that's real evidence. If it's roughly even across both groups, the price increase probably isn't the driver, and rolling it back would cost you revenue for no retention benefit.
>
> Can you pull that segmentation? That's a 20-minute query and it tells you whether this is a pricing problem or something else wearing a pricing costume.

---

## Claude

### Baseline (no Honestly)

> That's a reasonable hypothesis given the timing — a 0.4-point increase in monthly churn right after a price change is worth taking seriously. Before deciding, it might help to look at a few things: whether the churned customers were disproportionately price-sensitive segments, what the net revenue impact has been (the increase may still be net-positive even with some churn), and whether competitors have also raised prices recently.
>
> If you're fairly confident the price increase is the cause and the churn cost outweighs the revenue gain, rolling it back — or offering a smaller increase — would be a defensible call. I can help you model the revenue tradeoff if you want to look at the numbers side by side.

### With Honestly ([Cowork skill](../../honestly.skill) or [pasted adapter](../../framework/platform-adapters/claude.md))

> I'll push back on the causal claim before we get to whether to roll back anything.
>
> "Churn rose the same month prices rose" is a correlation, not a confirmed cause. A 0.4-point move (3% → 3.4%) needs two checks before it's meaningful:
>
> **1. Is this within normal variance?** Pull your last 12 months of monthly churn. If it regularly bounces between 2.8% and 3.6%, this month isn't a signal yet — it's noise you're pattern-matching to a story that fits.
>
> **2. If it's genuinely elevated, is it concentrated where the theory predicts?** Segment churned accounts: new-price cohort vs. grandfathered-price cohort. If the price theory is right, churn should be meaningfully higher in the new-price group. If it's roughly flat across both, something else is going on — and a rollback would sacrifice revenue to fix a problem that doesn't exist.
>
> I'm not saying the price increase is innocent — it's a legitimate hypothesis. I'm saying you don't have evidence yet, you have a plausible story with good timing. Those aren't the same thing, and a pricing decision this size deserves the 20 minutes it takes to check.
>
> What would change my read: if the segmentation shows churn concentrated in the new-price cohort at a rate clearly above the grandfathered group, I'd agree the price increase is the likely driver and support rolling it back or softening it.

---

## What this illustrates

Both platforms' baselines do the same thing: they accept "price increase caused the churn" as established and jump straight to solutions. ChatGPT's baseline is more visibly enthusiastic (emoji, exclamation point) but structurally makes the identical move Claude's baseline makes more soberly — neither one asks for the one piece of evidence (cohort segmentation) that would actually confirm or kill the theory.

With Honestly active, both platforms converge on the same reasoning move regardless of their default voice: separate the correlation from the causal claim, name what evidence would resolve it, and hold off on the recommendation until that evidence exists. The mechanism is platform-agnostic even though the phrasing isn't.
