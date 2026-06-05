# Integration Health Model

Use this to design a command center that tells the truth about its data.

## Integration record

Each integration should have:

- provider,
- account owner,
- connected status,
- auth type,
- last successful sync,
- last attempted sync,
- last error,
- next scheduled sync,
- webhook signature status,
- token expiry if known,
- retry count,
- support action.

## Suggested table

| Provider | Purpose | Status | Last success | Last attempt | Last error | Auth expires | Signature checked | Action |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Google Calendar | calendar context | unknown | TBD | TBD | TBD | TBD | n/a | inspect |
| Microsoft Email | inbox context | unknown | TBD | TBD | TBD | TBD | n/a | inspect |
| Calendly | booking events | unknown | TBD | TBD | TBD | n/a | TBD | verify secret |

## Status labels

Use labels that tell the truth:

- `connected`
- `not_connected`
- `syncing`
- `fresh`
- `stale`
- `failed`
- `needs_attention`
- `unknown`

Avoid labels like "live" or "synced" unless there is a recent successful run proving it.

## UI rule

Every dashboard number sourced from an integration should be able to answer:

- where did this data come from,
- when was it last refreshed,
- did the last sync fail,
- can the user retry safely,
- what should they do if it is stale.

