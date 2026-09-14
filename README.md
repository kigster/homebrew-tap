# kigster/homebrew-tap

Homebrew formulae for Konstantin's tools.

| Formula | What it is | Kind |
| :-- | :-- | :-- |
| [sopsy](https://github.com/kigster/sopsy) | The missing developer experience for [SOPS](https://github.com/getsops/sops) | Prebuilt binary |
| [svg2og](https://github.com/kigster/svg2og) | Convert Mermaid SVG exports for clean import into OmniGraffle | Prebuilt binary |
| [agent-lock](https://github.com/kigster/agent-lock) | Advisory locks for the coding agents that share one checkout | Ruby gem |

## Install

```bash
brew tap kigster/tap

brew install sopsy
brew install svg2og
brew install agent-lock
```

Or without tapping first:

```bash
brew install kigster/tap/sopsy
```

### sopsy

Installs a prebuilt binary, so no Rust toolchain is required, along with the
tools sopsy orchestrates: `sops`, `age`, and on macOS the Secure Enclave plugin
`age-plugin-se`. Homebrew resolves those automatically, so there is no need to
run `sopsy deps` afterward.

### agent-lock

Installs the gem and both of its executables, `agent-lock` and the short `alo`,
against Homebrew's own Ruby.

> [!NOTE]
> This is why the formula exists. macOS ships Ruby 2.6, the gem needs 3.2 or
> newer, and `gem install` into the system Ruby wants `sudo`. Homebrew's Ruby
> is neither of those problems.

## How formulae stay up to date

**The binaries.** Releases of sopsy and svg2og publish prebuilt assets for
macOS and Linux, and a GitHub Actions workflow refreshes the version and the
per-platform `sha256` when one lands.

**The gems.** A gem has no release assets to watch, so `bin/update-formula`
does the same job in one command, reading the checksum from the RubyGems API
rather than downloading and hashing the file:

```bash
gem push pkg/agent-lock-0.2.0.gem      # in the gem's repository
bin/update-formula agent-lock 0.2.0    # here
git commit -am "agent-lock 0.2.0"
```

There is no `version` line in a gem formula. Homebrew reads it out of the URL,
and stating it twice is something `brew audit` objects to.

## License

MIT, matching each of the tools.
