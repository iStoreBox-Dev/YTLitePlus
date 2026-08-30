# Release Process

This document describes how to build and publish releases for YTLitePlus.

## Prerequisites

- A decrypted YouTube `.ipa` file (not included in this repository)
- Theos installed and configured with `THEOS` environment variable set
- Access to GitHub Actions with workflow permissions enabled

## Manual Release Build

```bash
# Ensure submodules are up to date
git submodule update --init --recursive

# Build the package
./build.sh

# The output .ipa/.deb will be in the build directory
```

## Automated Release via GitHub Actions

The repository includes `.github/workflows/buildapp.yml` which automates the build process.

### Publishing a Release

1. **Create a new tag** for the release:
   ```bash
   git tag -a v1.0.0 -m "Release v1.0.0"
   git push origin v1.0.0
   ```

2. **Trigger the workflow** — the build workflow should run automatically on tag push.

3. **Verify the build** — check the Actions tab to ensure the workflow completed successfully.

4. **Create a GitHub Release**:
   - Go to Releases → Draft a new release
   - Select the tag you just pushed
   - Use `.github/RELEASE_TEMPLATE` as the template for release notes
   - Attach the built `.ipa` file from the workflow artifacts
   - Publish the release

## Release Notes Template

Release notes should follow the structure in `.github/RELEASE_TEMPLATE`:
- Version number and date
- Changelog (YouTube version, tweak versions, notable changes)
- Installation instructions
- Known issues

## Versioning Strategy

Use semantic versioning where possible:
- `v<major>.<minor>.<patch>` (e.g., `v1.0.0`, `v1.1.0`, `v1.1.1`)
- Major version bumps for breaking changes
- Minor version bumps for new features (new tweaks added)
- Patch version bumps for bug fixes

## Troubleshooting

If the build workflow fails:
1. Check the workflow logs in the Actions tab
2. Common failure points:
   - Theos/toolchain not properly configured
   - Submodule checkout errors
   - Signing certificate issues
   - YouTube IPA not found or corrupted

See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for common build and runtime issues.
