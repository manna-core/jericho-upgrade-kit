# 08 - Memory Spine Integration

```text
Integrate the project memory spine.

Goal:
Make future Claude sessions inherit product direction, current state, next steps, decisions, and safety rules.

Tasks:
1. Merge kit CLAUDE instructions into the target repo's existing CLAUDE.md or create one if absent.
2. Preserve existing product-specific instructions.
3. Create or update project-spine files.
4. Add templates that fit the repo.
5. Add or update .claude/skills if Claude Code is used.
6. Write a short README section explaining the build loop.

Rules:
- Keep CLAUDE.md concise.
- Move long procedures into skills or docs.
- Do not include private personal memory.
- Do not include secrets or customer data.

Verification:
- Start a new Claude Code session or simulate startup by reading files in order.
- Confirm the next move is clear from files alone.

Close:
- show changed memory files,
- explain what future Claude will know,
- recommend the next build batch.
```

