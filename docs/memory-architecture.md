# Memory Architecture

This is the Manna-inspired part of the kit.

The point is not to make the project poetic. The point is to stop important knowledge from evaporating between Claude sessions, late-night build pushes, sales calls, and production fixes.

## Memory layers

### Product soul

File: `templates/PRODUCT_SOUL.md`

Purpose:

- why the product exists,
- who it serves,
- what it must never become,
- the product taste and values.

Use this when Claude is making product or UX choices.

### Current state

File: `project-spine/current_state.md`

Purpose:

- what works today,
- what is partially working,
- known risks,
- last verified commands,
- primary surfaces and fallback surfaces.

Use this at the start of every build session.

### Next steps

File: `project-spine/next_steps.md`

Purpose:

- the best next concrete move,
- the next three upgrade batches,
- blockers,
- what not to start yet.

Use this to prevent Claude from wandering.

### Decision memory

File: `project-spine/decision_memory.md`

Purpose:

- durable architecture and product decisions,
- rejected options,
- why choices were made,
- future-self warnings.

Use this before refactors, auth changes, dependency changes, and integration changes.

### Relationship memory

File: `templates/RELATIONSHIP.md`

Purpose:

- how the product should relate to customers, sellers, admins, and builders,
- tone,
- trust boundaries,
- what the system should remember about a customer relationship,
- what it should never store.

Use this for sales/coaching/customer-memory features.

### Customer memory

File: `templates/CUSTOMER_MEMORY_RULES.md`

Purpose:

- allowed customer memory types,
- prohibited memory types,
- retention expectations,
- user-visible corrections,
- auditability.

Use this before building any customer intelligence or account memory feature.

## Daily logs versus curated memory

Daily logs are raw. Curated memory is distilled.

Suggested target repo structure:

```text
project-spine/
  current_state.md
  next_steps.md
  roadmap.md
  decision_memory.md
  task_state.json
  memory/
    2026-06-05.md
```

Daily logs can record what happened. `current_state.md`, `next_steps.md`, and `decision_memory.md` should keep only what future sessions need.

## The anti-chaos rule

If future Claude would need to know it, write it down before ending the session.

