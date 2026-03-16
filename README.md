This is a script to install [Tidal Cycles](https://tidalcycles.org/) on macOS,
using [Homebrew](https://brew.shA) for most of Tidal Cycles’ prerequisites.

To run the script, paste in Terminal:

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/nwhetsell/install-tidal-cycles/HEAD/install_tidal_cycles.sh)"
```

After running the script, you must configure Tidal Cycles’
[Pulsar](https://pulsar-edit.dev) package to find
[GHCi](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html).
To do this, open Pulsar’s Settings (press <kbd>Command</kbd>-<kbd>,</kbd>) choose Packages from the
sidebar, find tidalcycles in the list of Community Packages, click its Settings
button, and then set “Ghci Path” to

```
/opt/homebrew/opt/ghc/bin/ghci
```

Or, **if `~/.pulsar/config.cson` already exists**, run:

```sh
cat << EOS >> ~/.pulsar/config.cson
  tidalcycles:
    ghciPath: "$(brew --prefix ghc)/bin/ghci"
EOS
```
