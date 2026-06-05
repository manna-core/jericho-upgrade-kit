# Live Access Checklist

This checklist is for the point where Mark or the team wants Manna, Claude Code, or another builder to safely help with live systems.

Do not paste credentials into chat. Use provider dashboards, scoped tokens, and least privilege access.

## GitHub

Needed:

- access to the real production repositories,
- ability to create branches and pull requests,
- security settings visibility,
- Actions visibility,
- Dependabot and code scanning visibility.

Preferred:

- no direct pushes to `main`,
- branch protection,
- required build check,
- required review for production branches,
- secret scanning enabled,
- push protection enabled where available.

## Supabase

Needed:

- project reference for each live project,
- read access to Edge Functions list and deployed config,
- read access to logs,
- ability to view environment secrets names but not reveal values,
- ability to rotate secrets if needed.

Preferred:

- separate staging project,
- least privilege service accounts,
- RLS policy review access,
- database backup before migrations,
- function deploys through a reviewed branch or scripted release path.

## Vercel or hosting

Needed:

- project list,
- production and preview deploy visibility,
- environment variable names per environment,
- deployment logs,
- rollback visibility.

Preferred:

- preview deployments for pull requests,
- production branch protected,
- known rollback path,
- env vars separated by production, preview, and development.

## External integrations

Inventory each integration:

- provider name,
- owner account,
- purpose,
- secret name,
- webhook URL,
- signature method,
- last successful event,
- failure contact,
- rotation date.

Likely integrations:

- Google OAuth,
- Microsoft OAuth,
- email sending provider,
- SMS provider,
- Telegram,
- ElevenLabs,
- OpenAI or other AI provider,
- Calendly,
- Kajabi,
- YouTube,
- Meta Ads,
- Notion.

## Minimum handoff request

Ask for:

1. Repo access with branch and PR permissions.
2. Supabase read access plus permission to create staging functions.
3. Vercel preview/deployment visibility.
4. A list of live integrations and which ones matter most.
5. Permission to create a staging branch and run the safety inventory.

