# Function Classification Matrix

Use this before changing Supabase function auth.

## Legend

Auth class:

- `authenticated_user`
- `admin_only`
- `internal_job`
- `external_webhook`
- `oauth_callback`
- `public_trial_or_lead`
- `health_check`
- `unknown`

Risk:

- `low`
- `medium`
- `high`
- `critical`

## Matrix

| Function | Current `verify_jwt` | Auth class | Caller proof in handler | Reads sensitive data | Writes sensitive data | Uses service role | Risk | Action |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| example-function | TBD | unknown | TBD | TBD | TBD | TBD | TBD | inspect |

## Classification rules

### Authenticated user

Use when a signed-in user calls the function through the app.

Expected:

- `verify_jwt = true`,
- user token validated,
- RLS-scoped client preferred,
- role/company membership checked before sensitive data access.

### Admin-only

Use when the function performs privileged actions.

Expected:

- `verify_jwt = true`,
- admin role checked,
- company or tenant scope checked,
- audit log row written,
- no public fallback.

### Internal job

Use for scheduled jobs, queue workers, cron, and service-to-service calls.

Expected:

- gateway may be `verify_jwt = false`,
- handler validates an internal secret, named secret key, or signed caller,
- idempotency key where writes can repeat,
- run log row with failure reason.

### External webhook

Use for third-party providers.

Expected:

- `verify_jwt = false`,
- provider signature or header secret verified before writes,
- missing secret fails closed,
- invalid payload rejected before storage unless specifically quarantined without sensitive raw content.

### OAuth callback

Use for Google, Microsoft, or other OAuth callbacks.

Expected:

- `verify_jwt = false`,
- `state` validated,
- callback tied to an existing user/session/install record,
- tokens stored server-side only.

### Public trial or lead

Use for forms, demo onboarding, public lead capture, and public AI trials.

Expected:

- `verify_jwt = false`,
- strict payload validation,
- rate limiting or abuse protection,
- no private reads,
- minimal writes.

