# Momentum Command Center Priority Upgrades

## Priority 1: Lockfile and install reproducibility

Expected outcome:

- one intended package manager,
- clean install command,
- lockfile repaired intentionally,
- build verified from clean install.

## Priority 2: Analyst chat auth

Expected outcome:

- user token required,
- user/company scope validated,
- service-role access only after caller proof,
- prompt and SQL/data access logged safely.

## Priority 3: Internal hook secret

Expected outcome:

- all internal public hooks require `x-internal-hook-secret` or equivalent,
- secret name documented with no value,
- callers updated to send header,
- invalid calls fail closed.

## Priority 4: Webhook signatures

Expected outcome:

- Calendly/Kajabi/Zapier-style webhooks verify signatures or strong header secrets,
- no query-string secrets for new flows,
- invalid payloads rejected before sensitive storage.

## Priority 5: Integration health dashboard

Expected outcome:

- status per provider,
- last success,
- last error,
- retry action,
- stale labels,
- clear owner action.

