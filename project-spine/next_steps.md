# Next Steps

Keep this file short enough that Claude actually uses it.

## Recommended next move

Run `/jericho-safety-pass` and create or update `project-spine/function_classification_matrix.md`.

## Next three batches

### Batch 1: Inventory

- Read package scripts and deployment config.
- Count Supabase functions.
- Classify each function by auth class.
- Identify any function using service-role before caller validation.
- Identify `.env` or likely secret risks.
- Do not change source behavior yet.

### Batch 2: Guardrails

- Add or update `.env.example`.
- Ensure `.env` is ignored.
- Add CI skeleton or local validation scripts.
- Add dependency audit notes.
- Add targeted lint/build commands to `current_state.md`.

### Batch 3: First hardening patch

- Pick one highest-risk function or integration.
- Add caller validation or retire dangerous behavior.
- Add a focused test or smoke check if practical.
- Build and update state docs.

## Do not start yet

- Large UI redesign.
- Framework replacement.
- Database rewrites.
- Production deploy.
- New paid customer data flows.

## Open questions

- Which repo is live production?
- Which Supabase project is live?
- Which functions are deployed live?
- Which integrations currently have real customers connected?
- What is the most important sales workflow Mark wants demo-ready?

