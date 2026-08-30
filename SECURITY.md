# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this project (for example, a way a bundled tweak could leak user data, bypass App Store/YouTube security controls in a harmful way, or execute unauthorized code), please report it responsibly:

1. **Do not** open a public GitHub issue for the vulnerability.
2. Open a [private security advisory](../../security/advisories/new) on this repository if available, or contact the maintainers directly through GitHub by opening a draft security advisory.
3. Include: affected version/commit, a clear description of the issue, and reproduction steps if possible.

## Scope

This project packages third-party jailbreak/sideloading tweaks as git submodules. Vulnerabilities specific to an upstream tweak (e.g., YTLite, YTUHD) should ideally also be reported to that tweak's own repository, in addition to notifying us so we can pin/patch the submodule reference here.

## Response

We will acknowledge reports as soon as possible and work on a fix or a submodule pin/rollback to a known-safe version while a permanent fix is developed upstream.
