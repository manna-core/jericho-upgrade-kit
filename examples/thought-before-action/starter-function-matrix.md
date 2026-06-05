# Starter Function Matrix For Thought Before Action

This is not the full matrix. It is a seed for Claude to expand by reading `supabase/config.toml` and `supabase/functions/**`.

| Function | Likely class | Initial concern | First action |
| --- | --- | --- | --- |
| `admin-force-reset-password` | admin-only | dangerous if callable without admin proof | retire or gate, verify live state |
| `delete-company` | admin-only | destructive tenant/company action | require admin role, audit log |
| `reset-employee-password` | admin-only | sensitive identity action | verify user/company/admin proof |
| `chat-with-jericho` | public trial or authenticated user | currently public-looking AI surface | classify by intended caller, avoid private data exposure |
| `proxy-try-chat` | public trial | public AI/demo path | validate payload, rate limit, no private reads |
| `capture-sales-agent-lead` | public trial or lead | public writes | validate payload, rate limit |
| `receive-email-reply` | external webhook | email ingress | verify provider/correlation before writes |
| `process-email-reply` | internal job | queue-like processing | validate internal caller or queue source |
| `process-email-queue` | internal job | background mail processing | internal secret or scheduled proof |
| `send-email-reply` | internal job or authenticated user | sends external email | role/caller proof, audit |
| `send-growth-email` | internal job | sends external email | internal proof, run log |
| `send-sms` | internal job or authenticated user | sends SMS | caller proof, abuse protection |
| `receive-sms` | external webhook | Twilio/SMS ingress | provider signature |
| `telegram-webhook` | external webhook | public webhook | Telegram secret/header validation |
| `google-oauth-callback` | OAuth callback | token binding | state validation |
| `microsoft-oauth-callback` | OAuth callback | token binding | state validation |
| `google-gmail-read` | authenticated user or internal job | private email access | user/company proof, token scope |
| `microsoft-read-emails` | authenticated user or internal job | private email access | user/company proof, token scope |
| `process-reminders` | internal job | scheduled writes/messages | internal proof, idempotency |
| `generate-admin-eod-report` | internal job/admin-only | admin/company reporting | internal/admin proof |
| `crm-enrichment-watchdog` | internal job | background enrichment | internal proof, run log |
| `pipeline-intelligence-sweep` | internal job | sales data sweep | internal proof, audit |
| `keep-warm` | health/internal | low sensitivity if no private data | confirm no sensitive reads |

Claude should expand this into every function in the repo.

