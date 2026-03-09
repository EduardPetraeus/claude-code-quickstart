---
paths:
  - "**/*.py"
  - "**/*.sh"
  - "**/*.yml"
  - "**/*.yaml"
  - "**/*.json"
  - "**/*.env*"
  - "**/*.toml"
  - "**/*.cfg"
  - "**/*.ini"
---

# Security Review — Mandatory Before Push

Before every push or merge, scan ALL changed files for:
- Secrets, API keys, tokens, passwords (sk_live_, AKIA, ghp_, Bearer, password=)
- PII (emails, names, sensitive data in logs or comments)
- Hardcoded paths with usernames
- Sensitive data exposure in error messages or logs

## Procedure

1. Run `git diff` and inspect for sensitive patterns
2. Run `security-reviewer` custom agent for adversarial scan
3. If any issue found: fix FIRST, then commit
4. Never push with known security issues

This applies to every session, every repo, no exceptions.

## Secret Storage

Use your platform's secure secret storage:
- macOS: Keychain (`security` CLI)
- Linux: `pass`, `secret-tool`, or encrypted env files
- CI/CD: GitHub Actions secrets, vault services

Never store secrets in:
- Source code or config files
- Environment variables in committed `.env` files
- Comments or documentation
- Log output or error messages

## Secret Rotation

All API keys and tokens should be rotated on a quarterly schedule (every 90 days).

### Rotation Procedure

1. Generate new key in the service's dashboard
2. Update your secure storage with the new key
3. Update CI/CD secrets if applicable
4. Verify dependent services still work
5. Revoke the old key in the service's dashboard

### Tracking

Keep a timestamp of last rotation and set a reminder.
