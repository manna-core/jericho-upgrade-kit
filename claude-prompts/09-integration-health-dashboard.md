# 09 - Integration Health Dashboard

```text
Design and implement the first slice of an integration health dashboard.

Start by reading:
- project-spine/integration_health_model.md
- current integration code,
- sync/webhook functions,
- database tables related to integration runs or logs.

Goal:
Give admins truthful visibility into connected systems.

First slice:
- provider,
- status,
- last success,
- last attempt,
- last error,
- stale/fresh label,
- signature configured if webhook,
- retry action only when safe.

Rules:
- Do not invent freshness.
- Do not show "connected" unless auth exists.
- Do not expose secrets.
- Do not add risky writes without role checks.
- Keep UI dense and operational, not decorative.

Implementation:
1. Find existing tables/logs to reuse.
2. Add a minimal data model only if needed.
3. Add server/API access with admin or owner checks.
4. Add UI surface in the existing design style.
5. Add empty/error/loading states.

Verification:
- build,
- targeted lint,
- local UI smoke if possible,
- note any unverified provider data.

Update project-spine and recommend the next integration.
```

