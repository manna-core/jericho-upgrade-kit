# 06 - Webhook Signatures

```text
Inspect and harden webhook handlers.

Targets may include Calendly, Kajabi, Zapier, Stripe, Twilio, Telegram, GitHub, or provider-specific webhooks.

Rules:
- Do not accept unsigned sensitive writes.
- Do not store raw invalid webhook payloads before signature verification.
- Fail closed if the signing secret is missing.
- Prefer secrets in headers over query strings.
- Use timing-safe comparison for shared secret checks when available.
- Keep provider-specific raw body requirements intact.

Tasks:
1. Inventory webhook functions.
2. Record required secret names in the env register, no values.
3. Confirm current signature validation.
4. Patch one webhook or one provider family at a time.
5. Add clear 400/401 responses for invalid signatures.
6. Update function classification matrix.

Verification:
- test valid and invalid signature paths if feasible,
- targeted lint/type check,
- build if shared code changed.

Update project-spine and recommend the next webhook.
```

