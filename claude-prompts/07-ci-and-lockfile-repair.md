# 07 - CI And Lockfile Repair

```text
Improve build reproducibility and CI.

Start by inspecting:
- package.json scripts,
- package-lock.json, bun.lock, bun.lockb, pnpm-lock.yaml, yarn.lock,
- node version hints,
- GitHub workflows,
- deployment platform config.

Rules:
- Do not switch package managers casually.
- Do not regenerate lockfiles without explaining why.
- Do not hide dependency conflicts by deleting lockfiles.
- Do not make CI stricter than the repo can realistically pass on day one.

Tasks:
1. Identify the intended package manager.
2. Run the clean install command if practical.
3. If install fails, diagnose the exact conflict.
4. Propose the smallest lockfile repair path.
5. Add a CI workflow with install, build, targeted lint or lint budget, audit, and secret scan.
6. Add Dependabot config for npm and GitHub Actions if appropriate.

Verification:
- clean install or documented blocker,
- build,
- lint or lint budget,
- audit result recorded.

Update:
- current_state.md,
- next_steps.md,
- task_state.json,
- decision_memory.md.
```

