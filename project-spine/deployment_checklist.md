# Deployment Checklist

Use before production deploys.

## Pre-deploy

- [ ] Current branch is not dirty except intended changes.
- [ ] Changelog or handoff note is written.
- [ ] `current_state.md` and `next_steps.md` are updated.
- [ ] New env vars are documented in `.env.example`.
- [ ] No `.env` or secret files are staged.
- [ ] Function classification changes are reviewed.
- [ ] Database migrations are backed up or reversible.
- [ ] Rollback path is known.

## Verification

- [ ] Install succeeds from lockfile.
- [ ] Build passes.
- [ ] Targeted lint or lint budget passes.
- [ ] Tests or smoke checks pass.
- [ ] Dependency audit reviewed.
- [ ] Secret scan has no new findings.
- [ ] Preview deploy checked if available.

## Environment

- [ ] Production env vars exist.
- [ ] Preview env vars exist where needed.
- [ ] Supabase secrets exist.
- [ ] Webhook signing secrets exist.
- [ ] Internal hook secrets exist.
- [ ] OAuth redirect URLs match deployment domains.

## Post-deploy

- [ ] Production route smoke check.
- [ ] Key function smoke check.
- [ ] Integration health reviewed.
- [ ] Logs checked for first errors.
- [ ] Rollback instructions remain valid.
- [ ] State files updated with deploy result.

