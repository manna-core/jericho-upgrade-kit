# Agent Instructions

This repository is a public-safe upgrade kit. Treat it as tooling and documentation, not as the production application.

## Core rule

When integrating this kit into a target repo, work locally first and keep changes small, reviewable, and reversible.

## Do not include

- secrets,
- customer data,
- private logs,
- personal memory from unrelated systems,
- raw `.env` files,
- production database exports.

## Expected agent loop

1. Read the kit docs.
2. Read the target repo docs.
3. Inventory before patching.
4. Make one bounded change at a time.
5. Verify with the closest available command.
6. Update project state files.
7. Recommend the next move.

## Preferred output

For each implementation batch, report:

- what changed,
- why it is safe,
- how it was verified,
- what remains risky,
- the next recommended move.

