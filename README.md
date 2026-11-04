# kigster/homebrew-tap

Homebrew formulae for Konstantin's tools.

| Formula | What it is | Kind |
| :-- | :-- | :-- |
| [sopsy](https://github.com/kigster/sopsy) | The missing developer experience for [SOPS](https://github.com/getsops/sops) | Prebuilt binary |
| [svg2og](https://github.com/kigster/svg2og) | Convert Mermaid SVG exports for clean import into OmniGraffle | Prebuilt binary |
| [agent-lock](https://github.com/kigster/agent-lock) | Advisory locks for the coding agents that share one checkout | Ruby gem |
| [llm-evals](https://github.com/kigster/llm-evals) | Run evaluation suites against LLMs, then score and compare the results | Ruby gem |

## Install

```bash
brew tap kigster/tap

brew install sopsy
brew install svg2og
brew install agent-lock
brew install llm-evals
```

Or without tapping first:

```bash
brew install kigster/tap/sopsy
```

### sopsy

Installs a prebuilt binary, so no Rust toolchain is required, along with the
tools sopsy orchestrates: `sops`, `age`, `ykman`, and on macOS the Secure
Enclave plugin `age-plugin-se` and the YubiKey plugin `age-plugin-yubikey`.
Homebrew resolves those automatically, so there is no need to run `sopsy deps`
afterward.

### agent-lock

Installs the gem and both of its executables, `agent-lock` and the short
`alock`, against Homebrew's own Ruby, with bash and zsh completion for `alock`.
Every runtime dependency in `agent-lock.gemspec`, and theirs, is pinned as a
resource, including the `redis` gem for the Redis backend; no Redis server is
installed, and without one `alock` uses its file store.

> [!NOTE]
> This is why the formula exists. macOS ships Ruby 2.6, the gem needs 3.2 or
> newer, and `gem install` into the system Ruby wants `sudo`. Homebrew's Ruby
> is neither of those problems.

### llm-evals

Installs the gem and both of its executables, `llm-evals` and the short
`evals`, against Homebrew's own Ruby (the gem needs 3.4 or newer), with bash
and zsh completion for `evals`.

Every runtime dependency in `llm-evals.gemspec`, and theirs, is pinned as a
resource. None of the gems the repository's Gemfile adds for development and
tests are included. `bin/update-formula` moves only the gem itself, so a
release that changes a dependency means regenerating that list as well.

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
