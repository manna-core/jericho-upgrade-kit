# Thought Before Action Priority Upgrades

## Priority 1: Confirm dangerous admin endpoints are not live

Start with password reset, delete company, imports, admin reports, and any function using service-role access.

Expected outcome:

- admin endpoints require authenticated admin proof,
- obsolete dangerous functions return 410 or are deleted after migration,
- function matrix records the decision.

## Priority 2: Classify `verify_jwt = false`

Many functions may legitimately need `verify_jwt = false`, but every one needs a reason.

Expected classes:

- external webhook,
- OAuth callback,
- internal job,
- public trial/lead,
- health check.

Anything else should be inspected closely.

## Priority 3: Secret hygiene

Expected outcome:

- `.env` ignored,
- `.env.example` exists,
- no service-role keys in frontend code,
- old handoff docs checked for pasted credentials,
- rotation list created without printing secret values.

## Priority 4: Dependency and build gate

Expected outcome:

- clean install path documented,
- build passes,
- audit debt triaged,
- CI checks install/build/lint budget/audit/secret scan.

## Priority 5: Integration health

Start with the integrations most likely to affect demos and customers:

- Microsoft email/calendar,
- Google email/calendar,
- SMS,
- Telegram,
- email sending,
- AI providers.

