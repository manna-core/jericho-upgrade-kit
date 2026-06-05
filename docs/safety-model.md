# Safety Model

The main risk is not that the apps exist. The main risk is that a large integration system can accidentally expose sensitive data if public endpoints, service-role clients, secrets, and deployment habits are not controlled.

## Security posture this kit aims for

Default stance:

- customer and company data is sensitive,
- public endpoints are exceptions,
- service-role access is dangerous but sometimes necessary,
- every function should prove who called it before reading or writing private data,
- every deployment should be reversible,
- every secret should live outside source control.

## Supabase function classes

Every Edge Function should be classified before changing it.

| Class | Gateway auth | Handler auth | Examples | Notes |
| --- | --- | --- | --- | --- |
| Authenticated user | `verify_jwt = true` | validate user/session and role | dashboards, user actions, private AI calls | safest default |
| Admin-only | `verify_jwt = true` | validate admin/company role | delete company, reset user, imports | log every action |
| Internal job | usually `verify_jwt = false` | validate internal secret or signed caller | cron, queue workers | never rely on obscurity |
| External webhook | `verify_jwt = false` | verify provider signature | Stripe, Calendly, GitHub, Twilio | fail closed if secret missing |
| OAuth callback | `verify_jwt = false` | validate state/PKCE/session binding | Google, Microsoft callbacks | reject missing or stale state |
| Public trial/lead | `verify_jwt = false` | rate limit and validate payload | lead capture, demo onboarding | never expose private data |
| Health check | `verify_jwt = false` | no private data | `/health` | return minimal data |

## Service-role rule

Service-role clients may exist only inside server-side or edge code. A service-role key must never appear in:

- browser code,
- Vite `VITE_` variables,
- public docs,
- migrations that are committed with literal keys,
- UI fallbacks,
- test fixtures in Git.

If service-role code exists, the function must authenticate the caller before the privileged client is used.

## Webhook rule

If a provider sends a webhook, the handler should verify the provider signature or a strong shared secret from a header.

Avoid:

- secrets in query strings,
- accepting unsigned webhooks for writes,
- storing invalid payloads before signature verification,
- falling back open when the signing secret is missing.

## AI and data rule

AI features should be treated as data processors.

Before sending data to an AI model:

- know what data is being sent,
- remove secrets and irrelevant customer data,
- log the purpose at a high level,
- avoid storing raw prompts/responses when they contain sensitive data,
- label generated output as draft or AI-generated where users could mistake it for verified fact.

## Deployment rule

No production deploy should happen unless:

- build passes,
- relevant tests or smoke checks pass,
- no new secret scan findings,
- function classification changes are reviewed,
- rollback path is known,
- environment variables are present in the target environment,
- the deploy is tied to a short changelog entry.

