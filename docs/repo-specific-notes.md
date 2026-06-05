# Repo-Specific Notes

These notes are based on public local copies reviewed on 2026-06-02 and 2026-06-05. They are not a claim about what is currently deployed live.

## `marvinforever/thought-before-action`

Observed purpose:

- Jericho / Thought Before Action.
- Vite, React, TypeScript, Supabase, Vercel.
- Personal chief-of-staff and sales/coaching platform with many Edge Functions.

Strengths:

- Big product ambition.
- Meaningful existing product documents.
- Clear evidence of real iteration.
- Strong integration surface.
- Good candidate for memory-driven upgrade workflow.

Primary risks to inventory:

- many Supabase functions with `verify_jwt = false`,
- service-role usage in edge/server code,
- dependency audit debt,
- possible old secrets in historical handoff docs or Git history,
- public trial/OAuth/webhook functions that need classification,
- full lint may be too noisy to act as a release gate immediately.

Good first upgrades:

- build a function classification matrix,
- confirm live Supabase does not expose dangerous admin-only functions,
- rotate any secret that was ever committed or pasted,
- create an incremental lint ratchet,
- add a CI gate for build, audit, and secret scanning,
- create integration health status for email/calendar/SMS/Telegram/AI flows.

## `marvinforever/momentum-command-center`

Observed purpose:

- Momentum Command Center.
- TanStack Start, React, Supabase, Cloudflare/Vercel-style deployment.
- CRM, campaign, analytics, Kajabi, YouTube, Meta, Calendly, Notion style command center.

Strengths:

- Strong business operations direction.
- Clear fit for dashboards and executive reporting.
- Smaller function surface than Jericho.
- Good candidate for integration health dashboard first.

Primary risks to inventory:

- stale or conflicting lockfile path,
- internal public hooks need live secret verification,
- webhook signature setup must be confirmed live,
- no clear README at scan time,
- production build and runtime should be verified from a clean install.

Good first upgrades:

- regenerate lockfile intentionally,
- add README with local dev and deployment steps,
- document every webhook and internal hook,
- add integration health model,
- add CI gate,
- add analyst chat audit logs.

## `marvinforever/Intentional_Leader_course`

Observed purpose:

- Empty public repository at scan time.

Good first upgrade:

- add a minimal README if it is meant to stay public,
- archive it if it is unused,
- keep it empty if it is a placeholder and no product decision has been made.

