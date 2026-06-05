# 05 - Function Access Guards

```text
Harden one bounded group of Supabase functions.

Start by reading:
- supabase/config.toml
- project-spine/function_classification_matrix.md
- docs/safety-model.md or .jericho-upgrade-kit/docs/safety-model.md

Pick one group:
- admin-only functions,
- authenticated user functions,
- internal jobs,
- external webhooks,
- OAuth callbacks,
- public lead/trial functions.

Do not harden every function at once.

Implementation rules:
- Authenticated user functions should prefer verify_jwt=true and validate user/company/role before private data.
- Admin-only functions must check admin role and write audit logs when practical.
- Internal jobs with verify_jwt=false must validate an internal secret, named secret key, or signed caller.
- External webhooks must verify provider signatures or strong header secrets before writes.
- OAuth callbacks must validate state and bind tokens to the correct user/install record.
- Public trial functions must validate payloads, rate limit where practical, and avoid private reads.

Verification:
- targeted lint/type check,
- build if shared code changed,
- focused local invocation or unit test if available,
- update matrix with action and risk.

Close with:
- changed files,
- verification,
- remaining functions in this class,
- next safest function batch.
```

