# Sources

Researched on 2026-06-05. These are the official docs this kit uses for its Claude Code, Supabase, GitHub, and Vercel guidance.

## Claude Code

- Claude Code memory and `CLAUDE.md`: https://docs.claude.com/en/docs/claude-code/memory
- Claude Code skills and custom commands: https://code.claude.com/docs/en/slash-commands
- Claude Code settings scopes: https://code.claude.com/docs/en/settings
- Claude Code hooks reference: https://code.claude.com/docs/en/hooks
- Claude Code subagents: https://code.claude.com/docs/en/sub-agents

Relevant takeaways:

- Project memory can live in `CLAUDE.md` or `.claude/CLAUDE.md`.
- Project skills live under `.claude/skills/<skill-name>/SKILL.md`.
- Skills are preferred for repeatable workflows because their full instructions load only when used.
- Project settings are shared through `.claude/settings.json`; local settings belong in `.claude/settings.local.json`.
- Hooks can enforce deterministic checks, but this kit starts with skills and checklists to reduce install friction.

## Supabase

- Edge Function configuration and `verify_jwt`: https://supabase.com/docs/guides/functions/function-configuration
- Edge Function environment variables and secrets: https://supabase.com/docs/guides/functions/secrets
- Securing Edge Functions: https://supabase.com/docs/guides/functions/auth
- Deploying Edge Functions: https://supabase.com/docs/guides/functions/deploy

Relevant takeaways:

- Edge Functions require a valid JWT by default.
- `verify_jwt = false` is appropriate only when the handler authenticates the caller another way, such as signed external webhooks.
- Service-role or secret keys bypass row-level security and must never be used in browser code.
- `.env` files must not be checked into Git.
- Production function secrets belong in Supabase secrets management, not source files.

## GitHub

- Secret scanning and push protection: https://docs.github.com/en/code-security/how-tos/secure-your-secrets/detect-secret-leaks
- Code scanning with CodeQL: https://docs.github.com/en/code-security/concepts/code-scanning/codeql/about-code-scanning-with-codeql
- GitHub Actions secure use: https://docs.github.com/en/actions/reference/security/secure-use
- Dependabot version updates: https://docs.github.com/en/code-security/how-tos/secure-your-supply-chain/secure-your-dependencies/configuring-dependabot-version-updates

Relevant takeaways:

- Public repos can use secret scanning.
- CodeQL supports JavaScript and TypeScript.
- GitHub Actions should grant the least privileges required.
- Dependabot version updates are configured through `.github/dependabot.yml`.

## Vercel

- Environment variables: https://vercel.com/docs/environment-variables
- Instant rollback: https://vercel.com/docs/instant-rollback
- Deployment environments: https://vercel.com/docs/deployments/environments

Relevant takeaways:

- Env var changes apply to new deployments, not previous deployments.
- Production and preview environments should be separated.
- Rollback can restore a previous production deployment, but configuration may become stale.

