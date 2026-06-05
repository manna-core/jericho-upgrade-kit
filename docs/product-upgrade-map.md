# Product Upgrade Map

This kit assumes the software is not one small app. It is closer to an operating system for sales, coaching, company intelligence, personal delegation, customer memory, and integration-driven workflows.

## Product surfaces

### Jericho / Thought Before Action

Likely role:

- personal chief of staff,
- sales coaching companion,
- company and customer intelligence layer,
- email/calendar/action follow-up assistant,
- learning and capability system,
- voice, SMS, Telegram, Microsoft, Google, and Supabase workflow hub.

High-leverage upgrade direction:

- make it safer around company/customer data,
- make it more reliable across integrations,
- make memory and decisions explicit,
- make sales workflows faster to run,
- make admin/company operations auditable.

### Momentum Command Center

Likely role:

- business command center,
- campaign and CRM reporting layer,
- Kajabi/Calendly/YouTube/Meta/Notion style integration hub,
- analyst chat and executive reporting surface.

High-leverage upgrade direction:

- integration health dashboard,
- secure analyst chat,
- source-of-truth campaign reporting,
- weekly executive report,
- clean lockfile and CI path.

### Marvin / builder layer

Likely role:

- builder identity, memory, strategy, and project operating layer around the apps.

High-leverage upgrade direction:

- stop project context from living only in chat,
- keep product decisions in files,
- give Claude repeatable skills,
- create a better handoff between sales, implementation, and support.

## Upgrade phases

### Phase 0: Stabilize the ground

Do first because customers and companies may trust this software with sensitive data.

- Secret hygiene.
- Live function inventory.
- Function auth classification.
- Dependency and lockfile cleanup.
- Build and deploy checklist.
- Basic CI gates.

### Phase 1: Make the system remember

Do second because the project is too large for ad hoc prompting.

- `project-spine/current_state.md`
- `project-spine/next_steps.md`
- `project-spine/roadmap.md`
- `project-spine/decision_memory.md`
- `project-spine/task_state.json`
- function classification matrix,
- integration health model,
- customer memory rules.

### Phase 2: Make integrations observable

Do third because a command center is only trusted when users can see whether it is fresh.

- last sync times,
- last successful write,
- last error and retry count,
- webhook signature status,
- stale data labels,
- manual retry button,
- audit log link.

### Phase 3: Product upgrades that sell

Do after the safety spine exists.

- Sales operator cockpit.
- Customer memory brief.
- Pre-call plan generator.
- Follow-up drafter.
- Deal risk view.
- Executive weekly report.
- ROI dashboard.
- Integration setup wizard.

## Best product rule

Never let the UI imply data is live, complete, authenticated, or synced unless the backend can prove that it is.

