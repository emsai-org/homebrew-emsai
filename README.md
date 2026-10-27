# Emsai for Homebrew

[Emsai](https://emsai.app) runs every coding agent on your Mac in one native
window, and puts the Mac around them in the same app. This is its Homebrew
tap: one cask, the same signed and notarized disk image as the one on
[emsai.app/download](https://emsai.app/download).

## Install

```sh
brew trust emsai-org/tap     # Homebrew 7 loads nothing from a tap that isn't its own until you say so
brew tap emsai-org/tap
brew install --cask emsai
```

Emsai lands in `/Applications`. Open it from there: the 7-day trial
starts, every feature, no card, no account. (Homebrew 7 refuses a cask from
a tap that isn't Homebrew's until you trust it, and won't tap one on the
way: that's what the first two lines are for.)

Requires macOS 26 (Tahoe) or later.

## Update

Emsai updates itself (Settings › General › Updates), so Homebrew doesn't
treat it as outdated once the app has taken a newer release. To update
through Homebrew anyway:

```sh
brew upgrade emsai
```

## Uninstall

```sh
brew uninstall emsai          # quits Emsai, removes the app and its login item
brew uninstall --zap emsai    # also deletes its data: settings, notes, clipboard history
```

## Releases

Each release is published on
[emsai-org/emsai-releases](https://github.com/emsai-org/emsai-releases);
the cask follows it, version and checksum, through a pull request here.

Questions or problems: [hello@emsai.app](mailto:hello@emsai.app).
