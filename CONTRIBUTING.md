# Contributing to YTLitePlus

Thanks for your interest in improving this project. This document describes how to report bugs, propose features, and submit changes.

## Reporting bugs

1. Search existing issues first to avoid duplicates.
2. Use the applicable issue template under `.github/ISSUE_TEMPLATE`.
3. Include: iOS/iPadOS version, device model, sideload/jailbreak method, tweak version, and reproduction steps.
4. If the bug reproduces on stock upstream YTLitePlus as well, link the upstream issue for context.

## Proposing a new tweak / feature

1. Open an issue describing the tweak, its upstream repository, and why it should be included.
2. Confirm license compatibility with this project's [LICENSE](LICENSE).
3. Once approved, add the tweak as a git submodule under `Tweaks/`:
   ```bash
   git submodule add <repo-url> Tweaks/<TweakName>
   ```
4. Wire up any required hooks in `YTLitePlus.xm`/`YTLitePlus.h`, following the existing patterns used for other tweaks in this repo.
5. Update the Makefile if the tweak requires additional build steps or link flags.
6. Update `README.md`'s feature table.

## Code style

- Follow the existing Logos (`.xm`) conventions already used in `YTLitePlus.xm` (hook grouping, naming, comment style).
- Keep changes scoped to a single tweak/feature per pull request where possible.
- Do not commit decrypted YouTube binaries, signing certificates, or provisioning profiles.

## Submitting a pull request

1. Fork the repo and create a branch named `fix/<issue-number>-short-description` or `feature/<issue-number>-short-description`.
2. Reference the related issue number in your commit messages and PR description (e.g. `Fixes #123`).
3. Ensure `./build.sh` completes successfully before opening the PR.
4. Describe manual testing performed (device/iOS version, what you verified).

## Reporting security issues

Do not open a public issue for security vulnerabilities. See [SECURITY.md](SECURITY.md).
