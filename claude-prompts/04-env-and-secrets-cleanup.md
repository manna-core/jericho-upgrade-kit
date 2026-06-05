# 04 - Env And Secrets Cleanup

```text
Perform local env and secret hygiene.

Rules:
- Do not print secret values.
- Do not commit .env files.
- Do not rotate live secrets unless explicitly asked.
- If a value appears to be a real secret in committed files, replace it with a placeholder and tell the human it may need rotation.

Tasks:
1. Find committed env files and hardcoded secret-looking values.
2. Ensure .gitignore ignores .env, .env.*, Supabase local temp files, and logs, while allowing .env.example.
3. Create or update .env.example with placeholder names only.
4. Create or update an environment variable register with names, purpose, and environment, no values.
5. Search frontend code for server-only variables or service-role usage.
6. Search docs for pasted tokens, passwords, webhook secrets, OAuth secrets, and service keys.

Verification:
- run a local secret scan using available tools or targeted ripgrep patterns,
- confirm no .env is staged,
- run build if env access code changed.

Update:
- project-spine/current_state.md,
- project-spine/next_steps.md,
- project-spine/task_state.json,
- decision_memory.md if rotation is recommended.
```

