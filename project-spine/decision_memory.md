# Decision Memory

Record durable decisions here. Keep entries short and useful.

## Decision format

```text
YYYY-MM-DD - Decision title
Decision:
Reason:
Rejected:
Future warning:
```

## Initial decisions

### 2026-06-05 - Use project spine before large upgrades

Decision:

Create project-spine files before deep implementation.

Reason:

The system is large enough that chat-only context will drift. Security, product direction, and deployment state need durable memory.

Rejected:

Jumping directly into feature work without inventory.

Future warning:

If Claude starts suggesting large rewrites before updating current state and next steps, stop and re-anchor the session.

### 2026-06-05 - Classify functions before changing auth flags

Decision:

Do not blindly set every Supabase function to `verify_jwt = true`.

Reason:

Some functions may be legitimate webhooks, OAuth callbacks, public trial routes, or internal jobs. The safe path is classification plus handler-level proof.

Rejected:

Mass-changing auth flags and hoping the app still works.

Future warning:

`verify_jwt = false` can be correct only when the handler verifies the caller another way or returns only non-sensitive public data.

