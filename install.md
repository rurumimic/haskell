# Install

- haskell.org
  - [GHCup](https://www.haskell.org/ghcup)

## Install GHCup

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

```bash
Welcome to Haskell!

This script can download and install the following binaries:
  * ghcup - The Haskell toolchain installer
  * ghc   - The Glasgow Haskell Compiler
  * cabal - The Cabal build tool for managing Haskell software
  * stack - A cross-platform program for developing Haskell projects (similar to cabal)
  * hls   - (optional) A language server for developers to integrate with their editor/IDE

ghcup installs only into the following directory,
which can be removed anytime:
  $HOME/.ghcup
```

Version:

```bash
ghc --version
stack --version
cabal --version
```

## Start GHCi

`Prelude>` prompt → `λ:`:

```bash
echo ':set prompt  "\\x03BB: "' | tee -a $HOME/.ghci > /dev/null && chmod 644 $HOME/.ghci
```

Start GHCi:

```bash
ghci
λ:
```

Quit:

```bash
λ: :help
λ: :quit
```

