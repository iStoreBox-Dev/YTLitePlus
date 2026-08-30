# YTLitePlus

A modified version of the YouTube app for iOS, supercharged with [YTLite](https://github.com/dayanch96/YTLite) (by @dayanch96) and a curated set of additional tweaks, packaged as a [Theos](https://theos.dev) project and built automatically via GitHub Actions.

> This is a maintained fork of [YTLitePlus/YTLitePlus](https://github.com/YTLitePlus/YTLitePlus). See [Credits](#credits) for all upstream tweak authors.

## Features

### Currently Bundled Tweaks

| Tweak | Author | Description |
|---|---|---|
| YTLite | dayanch96 | Core tweak: removes ads, unlocks background play, downloads, and more |
| YTUHD | splaser | Unlocks higher video quality options |
| YouPiP | PoomSmart | Picture-in-Picture support |
| Return-YouTube-Dislikes | PoomSmart | Restores the dislike count |
| YTVideoOverlay | PoomSmart | Video player overlay customization |
| YouGroupSettings | PoomSmart | Groups tweak settings into the YouTube app settings UI |
| YTABConfig | PoomSmart | A/B config flag management |
| YTHeaders / YouTubeHeader | therealFoxster / PoomSmart | Header/interface definitions used by the tweaks above |
| YouTimeStamp | aricloverALT | Timestamp-related enhancements |
| DontEatMyContent | therealFoxster | Prevents content-blocking behavior |
| FLEXing | PoomSmart | In-app debugging via FLEX |
| PSHeader | PoomSmart | Shared preference/header utilities |
| Alderis | hbang | Color picker UI component |
| protobuf | Google | Protocol buffers library (dependency) |

### Planned Tweaks (Future Releases)

The following tweaks are tracked in issue #3 and planned for future addition:

| Tweak | Author | Description |
|---|---|---|
| iSponsorBlock | PoomSmart | Skip sponsored segments, intros, outros |
| YTSpeed | PoomSmart | Playback speed control (2x, 2.5x, 3x, etc.) |
| YouMute | PoomSmart | Mute button in video player |
| YTNoTracking | PoomSmart | Disable tracking parameters in URLs |
| BigYTMiniPlayer | PoomSmart | Larger miniplayer |
| YTHoldForSpeed | PoomSmart | Hold gesture for temporary speed boost |
| YouQuality | PoomSmart | Quick quality selector |
| YTNoModernUI | PoomSmart | Revert modern UI changes |
| OLEDDarkmode / OLDDarkmode | Various | Alternative dark mode themes |
| LowContrastMode | Various | Low contrast UI mode |
| YouRememberCaption | PoomSmart | Remember caption preferences |
| YTNoCheckLocalNetWork | Various | Bypass local network check prompt |

## Requirements

- macOS or Linux with [Theos](https://theos.dev) installed and `THEOS` environment variable set
- Xcode command line tools (macOS) or a configured Linux toolchain for Theos
- A decrypted YouTube `.ipa` (not included/distributed in this repo) placed where `build.sh` expects it
- `git` with submodule support

## Getting the source

```bash
git clone --recurse-submodules https://github.com/iStoreBox-Dev/YTLitePlus.git
cd YTLitePlus
```

If you already cloned without `--recurse-submodules`:

```bash
git submodule update --init --recursive
```

## Building

```bash
./build.sh
```

or, using the provided Makefile targets directly:

```bash
make package   # builds the .deb/.ipa package
make clean     # cleans build artifacts
```

Build output (signed/unsigned `.ipa`) is produced according to the `Makefile`/`build.sh` configuration. Refer to inline comments in `build.sh` for environment variables that control signing and output paths.

## Installing

- **Jailbroken devices**: install the generated `.deb` via your package manager (Sileo/Zebra) or `dpkg -i`.
- **Non-jailbroken / sideloading**: use the generated `.ipa` with a sideloading tool (AltStore, SideStore, Sideloadly, etc.).

## Continuous Integration

- `.github/workflows/update-submodules.yml` — keeps tweak submodules up to date on a schedule.
- `.github/workflows/buildapp.yml` — builds the app package on tag push or manual trigger.
- `.github/workflows/delete-workflow-runs.yml` — housekeeping for old workflow runs.

See [RELEASE.md](RELEASE.md) for how to publish a release.

## Known Issues

This fork inherits some known issues from upstream YTLitePlus/YTLitePlus. See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for details and workarounds:

| Issue | Status |
|---|---|
| Forced "Update Available" prompt in YouTube | Investigating (upstream broken) |
| Crash on app/video open ("Something went wrong") | Investigating (upstream broken) |
| Interface/Bottom Bar settings non-functional | Known broken (upstream) |
| Video playback errors after ~1 minute | Investigating (upstream) |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to propose a new tweak, report a bug, or submit a pull request.

## Security

See [SECURITY.md](SECURITY.md) for how to report a security issue.

## Credits

This project bundles or depends on work by:

- [@dayanch96](https://github.com/dayanch96) — YTLite
- [@PoomSmart](https://github.com/PoomSmart) — YTUHD-related work, YouPiP, Return-YouTube-Dislikes, YTVideoOverlay, YouGroupSettings, YTABConfig, YouTubeHeader, FLEXing, PSHeader, YTSpeed, iSponsorBlock, YouMute, and more
- [@therealFoxster](https://github.com/therealFoxster) — YTHeaders, DontEatMyContent
- [@hbang](https://github.com/hbang) — Alderis
- [@splaser](https://github.com/splaser) — YTUHD
- [@aricloverALT](https://github.com/aricloverALT) — YouTimeStamp
- [@Google](https://github.com/protocolbuffers) — protobuf
- The [YTLitePlus/YTLitePlus](https://github.com/YTLitePlus/YTLitePlus) project and contributors, on which this fork is based

## License

See [LICENSE](LICENSE) for full license terms. This project bundles third-party tweaks under their own respective licenses (see each submodule's repository).
