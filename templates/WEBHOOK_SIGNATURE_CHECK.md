# Webhook Signature Check Pattern

Use for public webhook functions.

## Goal

Reject unsigned or forged webhook calls before reading, writing, or storing sensitive payload data.

## Checklist

- [ ] Identify provider signature docs.
- [ ] Confirm whether provider requires the raw request body.
- [ ] Read body exactly as provider expects.
- [ ] Verify signature before parsing or storing sensitive content.
- [ ] Fail closed if the signing secret is missing.
- [ ] Return `400` for bad signature.
- [ ] Return `401` for missing/invalid shared secret where applicable.
- [ ] Do not log signature, secret, token, or raw sensitive payload.

## Shared secret fallback

If the provider does not support signatures, prefer:

- `x-webhook-secret` header,
- timing-safe comparison,
- secret stored in provider dashboard and Supabase/Vercel env,
- rotation plan.

Avoid:

- query-string secrets,
- weak static public paths,
- accepting missing secrets in production.

