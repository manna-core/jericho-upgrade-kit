# Trusted Request Guard Pattern

Use for internal jobs or service-to-service calls when Supabase gateway JWT verification cannot be used.

## Goal

Allow internal callers while rejecting random public traffic.

## Requirements

- Secret comes from environment variables.
- Caller sends the secret in a header, not a query string.
- Missing configured secret fails closed.
- Compare values safely.
- Do not log the secret.

## Pseudocode

```ts
function getHeader(req: Request, name: string): string {
  return req.headers.get(name) ?? "";
}

function timingSafeEqualText(a: string, b: string): boolean {
  if (!a || !b || a.length !== b.length) return false;

  let diff = 0;
  for (let i = 0; i < a.length; i += 1) {
    diff |= a.charCodeAt(i) ^ b.charCodeAt(i);
  }
  return diff === 0;
}

function assertInternalCaller(req: Request): Response | null {
  const expected = Deno.env.get("INTERNAL_HOOK_SECRET") ?? "";
  if (!expected) {
    return new Response("internal secret not configured", { status: 500 });
  }

  const actual = getHeader(req, "x-internal-hook-secret");
  if (!timingSafeEqualText(actual, expected)) {
    return new Response("unauthorized", { status: 401 });
  }

  return null;
}
```

## Notes

Adapt the environment variable name to the repo. Record the variable name in the env register, not the value.

