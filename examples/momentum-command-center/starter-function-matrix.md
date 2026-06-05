# Starter Function Matrix For Momentum Command Center

This is a seed for Claude to expand by reading the repo.

| Function or hook | Likely class | Initial concern | First action |
| --- | --- | --- | --- |
| `analyst-chat` | authenticated user | private analytics/chat | require user JWT and validate scope |
| `youtube-sync` | internal job/admin action | sync writes and external API | require user token or internal secret |
| `kajabi-webhook` | external webhook | public webhook writes | verify signature or strong header secret |
| `campaign-ingest` | internal hook | public/internal write path | require internal secret |
| `audit-queue-build` | internal hook | background/audit write path | require internal secret |
| `performance-snapshot` | internal hook | analytics write path | require internal secret |
| `weekly-rollup` | internal hook | scheduled reporting | require internal secret |
| `meta-sync` | internal hook | ad data sync | require internal secret |

Claude should confirm which of these exist in the current target repo and update the matrix accordingly.

