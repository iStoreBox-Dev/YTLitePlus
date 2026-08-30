# YTLite Update Instructions

## Current Status
- **Old version**: v5.0.1 (removed)
- **Target version**: v5.2.2 (latest as of August 2026)

## How to Update

### Step 1: Download Latest YTLite

Download the latest YTLite/YTPlus IPA or deb files from one of these sources:
- **Official builds.io**: https://builds.io/apps/social-media/youtubeplus
- **GitHub releases**: Check https://github.com/dayanch96/YTLite/releases (if available)
- **Trusted IPA sources**: IPAUniverse, r/sideloaded wiki

Look for files named like:
- `com.dvntm.ytlite_5.2.2_iphoneos-arm.deb`
- `com.dvntm.ytlite_5.2.2_iphoneos-arm64.deb`
- Or the full IPA: `YouTubePlus_5.2.2.ipa`

### Step 2: Extract deb Files

If you downloaded an IPA:
```bash
unzip YouTubePlus_5.2.2.ipa
# Look in Payload/YouTube.app/ for the tweak deb files
# Or use dpkg-deb to extract
```

### Step 3: Place deb Files

Copy the extracted deb files to this directory:
```
Tweaks/YTLite/
├── com.dvntm.ytlite_5.2.2_iphoneos-arm.deb
├── com.dvntm.ytlite_5.2.2_iphoneos-arm64.deb
├── YTLite-UPDATE.md (this file)
└── .gitkeep
```

### Step 4: Update Build Scripts

If your `build.sh` or `Makefile` references specific YTLite version numbers, update them:
```bash
# Example: update version variable in build.sh
YTLITE_VERSION="5.2.2"
```

### Step 5: Test Build

```bash
./build.sh
# Verify build completes successfully
# Check that the output IPA includes YTLite features
```

### Step 6: Test On-Device

1. Sideload the built IPA with your preferred method (AltStore, SideStore, Sideloadly, etc.)
2. Test core functionality:
   - App launch and login
   - Video playback (normal, background, PiP)
   - Ad blocking
   - All settings in YouTube → Settings → YTLite/YTPlus section
   - No crashes when opening videos, switching tabs, using search

### Step 7: Commit and Push

```bash
git add Tweaks/YTLite/
git commit -m "chore: update YTLite to v5.2.2

- Remove old v5.0.1 deb files
- Add v5.2.2 deb files
- Tested with YouTube v21.32.4
- All features working: ad blocking, PiP, background play, settings
"
git push origin enhancement/issue-10-update-ytlite-to-5.2.2
```

## Notes

- **YouTube version compatibility**: YTLite v5.2.2 is designed for YouTube v21.32.4+. Ensure your build uses a compatible YouTube IPA.
- **Paid model warning**: As of 2026, YTLite/YTPlus has transitioned to a paid model. Free versions (v5.2b4 and earlier) may be the last freely available builds.
- **Upstream status**: The YTLitePlus/YTLitePlus project is deprecated. This fork is independently maintained.

## Troubleshooting

**Build fails with "YTLite deb not found"**: Verify the deb files are in the correct path and named correctly.

**App crashes on launch**: The YTLite version may be incompatible with your YouTube IPA version. Try a different YouTube version or YTLite build.

**Features missing**: Ensure you're testing with the built IPA, not just the deb files. The deb files are extracted during the build process.
