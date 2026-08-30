# Troubleshooting

This document covers common issues encountered when building or using YTLitePlus.

## Build Issues

### Theos Not Found

**Error:** `make: THEOS environment variable not set`

**Solution:**
```bash
export THEOS=/path/to/theos
# Add to your shell profile for persistence
```

### Submodule Checkout Fails

**Error:** `fatal: could not read Username for 'https://github.com'`

**Solution:**
```bash
git submodule update --init --recursive
# If that fails, try:
git submodule sync
git submodule update --init --recursive
```

### Build Succeeds But No IPA Produced

**Check:**
- Verify the decrypted YouTube IPA is in the expected location (see `build.sh`)
- Check Makefile for correct `TARGET` and `ARCH` settings
- Ensure all submodule dependencies are present

## Runtime Issues

### "Update Available" Prompt

**Symptom:** YouTube shows a forced update prompt that blocks usage.

**Known Issue:** This is a known upstream issue affecting YTLite-based tweaks when YouTube changes their version detection logic.

**Workarounds:**
1. Try sideloading with a different YouTube IPA version (check upstream YTLitePlus issues for known-working versions)
2. Wait for upstream to release a fix for the version-check bypass
3. Check if a newer YTLite submodule commit is available that addresses this

### App Crashes on Launch or Video Open

**Symptom:** App crashes immediately or when opening a video with "Something went wrong, tap to retry".

**Possible Causes:**
- Incompatible tweak version with the YouTube app version
- Corrupted IPA or sideload process
- Jailbreak/sideload environment conflict

**Troubleshooting Steps:**
1. Try a different YouTube IPA version (older or newer)
2. Re-sign and reinstall the IPA
3. Check device logs for crash details (Console.app on macOS or device log tools)
4. Test with individual tweaks disabled (advanced: modify `YTLitePlus.xm` to conditionally disable hooks)

### Interface/Bottom Bar Settings Not Working

**Symptom:** Settings toggles for Interface or Bottom Bar have no effect.

**Known Issue:** Upstream reported this as broken in early 2026 due to YouTube UI changes.

**Status:** Awaiting upstream fix. Track progress on the main YTLitePlus/YTLitePlus repository issues.

### Video Playback Stops After ~1 Minute

**Symptom:** Videos play for about a minute then error out.

**Possible Causes:**
- Network/content delivery issue
- Tweak conflict with YouTube's streaming logic
- Outdated tweak version

**Workarounds:**
1. Try a different network (WiFi vs cellular)
2. Update to the latest YTLitePlus build
3. Test with a different YouTube IPA version

## Known Issues (August 2026)

The following issues are inherited from upstream and are being tracked:

| Issue | Status | Upstream Reference |
|---|---|---|
| Forced "Update Available" prompt | Investigating | YTLitePlus/YTLitePlus#711, #716 |
| Crash on app/video open | Investigating | YTLitePlus/YTLitePlus#632 |
| Interface/Bottom Bar settings non-functional | Known broken | YTLitePlus/YTLitePlus#583 |
| Video playback errors after ~1 min | Investigating | YTLitePlus/YTLitePlus#605 |

## Getting Help

1. **Search existing issues** — your issue may already be reported
2. **Check upstream** — many issues originate in upstream tweak repositories
3. **Provide details** — when opening an issue, include:
   - iOS/iPadOS version
   - Device model
   - Sideload/jailbreak method
   - YTLitePlus version (commit SHA or release tag)
   - YouTube app version
   - Exact reproduction steps

## Reporting a Bug

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to report bugs effectively.
