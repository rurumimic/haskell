# Install Stack

```bash
curl -sSL https://get.haskellstack.org/ | sh
```

WARNING: `$HOME/.local/bin` is not on your PATH:

```bash
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
# echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshenv
```

Version:

```bash
stack --version
```

## Start GHCi

`Prelude>` prompt → `λ:`:

```bash
echo ':set prompt  "\\x03BB: "' >> ~/.ghci
```

Start GHCi:

```bash
stack ghci
λ:
```

Quit:

```bash
λ> :help
λ> :quit
```
