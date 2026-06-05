# Nonbreaking Upgrade Policy

This kit is designed for upgrades that preserve the existing product.

## Definition of nonbreaking

An upgrade is nonbreaking when:

- existing users can still complete the same core workflows,
- existing data remains readable,
- routes and function names do not change unless aliases remain,
- environment variables are added with fallbacks or documented clearly,
- dangerous endpoints are retired with clear status codes and messaging,
- deployment can be rolled back.

## Allowed by default

- Add documentation.
- Add `.env.example`.
- Add validation before sensitive writes.
- Add logging that does not expose secrets or sensitive raw data.
- Add tests.
- Add CI.
- Add project memory files.
- Add status labels for stale or unverified data.
- Add internal helper wrappers behind existing behavior.

## Requires explicit approval

- Database migrations that drop or rewrite data.
- Function renames.
- Route removals.
- Auth flow changes.
- Production deploys.
- Secret rotations.
- Provider webhook URL changes.
- Replacing a major framework or runtime.
- Removing a product feature.

## Claude batch size rule

One upgrade batch should be small enough to explain in five bullets and verify with one or two commands.

If Claude wants to touch more than one subsystem, split the work.

## Review language

Use direct, respectful language:

- "This endpoint needs classification before production use."
- "This secret appears to need rotation if it was ever live."
- "This function should stay public only if the handler verifies the caller another way."

Avoid blame language. The goal is to make the system stronger.

