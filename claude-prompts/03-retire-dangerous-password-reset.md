# 03 - Retire Dangerous Password Reset

Use only if the repo contains an admin password reset function that can be called without strong admin proof.

```text
Inspect password reset and admin reset functions.

Goal:
Retire or gate any endpoint that lets a caller reset another user's password without strong admin authentication and audit logging.

Constraints:
- Do not break normal user password recovery.
- Do not deploy.
- Do not change live Supabase settings.
- Do not expose user emails or IDs in logs.

Implementation preference:
1. If the endpoint is obsolete or unsafe, return 410 Gone with a short JSON message.
2. Set gateway auth to require JWT if the function should not be public.
3. If keeping it, validate user session, admin role, company scope, and write an audit log.
4. Update function classification matrix.
5. Add or update a focused test/smoke note if practical.

Verify:
- targeted lint or type check,
- build if frontend imports changed,
- grep for callers and update/remove unsafe callers.

Close:
- summarize changed files,
- record verification,
- update project-spine/current_state.md,
- update project-spine/next_steps.md.
```

