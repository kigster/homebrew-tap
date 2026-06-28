# kigster/homebrew-tap

Homebrew formulae for [sopsy](https://github.com/kigster/sopsy) — the missing
developer experience for [SOPS](https://github.com/getsops/sops).

## Install

```bash
brew install kigster/tap/sopsy
```

This installs a **prebuilt binary** — no Rust toolchain required — along with the
tools sopsy orchestrates: `sops`, `age`, and (on macOS) the Secure Enclave plugin
`age-plugin-se`. Homebrew resolves and installs those dependencies automatically,
so you do not need to run `sopsy deps` afterward.

Equivalent explicit form:

```bash
brew tap kigster/tap
brew install sopsy
```

## How it stays up to date

Releases of sopsy publish prebuilt binaries for macOS (arm64/x86_64) and Linux
(arm64/x86_64) as GitHub Release assets. The `update-formula` workflow in this
repository refreshes `Formula/sopsy.rb` (version + per-platform `sha256`) whenever
a new sopsy version is released.

## License

MIT, matching sopsy.
