
# LSPM - Little Simple Package Manager

LSPM is a lightweight, simple, and fast package manager designed to run on anything (alpine, debian, linux from scratch, buildroot).

It supports installing, upgrading, and removing packages, managing multiple repositories, and creating packages with minimal effort.

---

## Features

> - Minimal footprint, works with as little as 64MB RAM and tiny CPU cores  
> - Multi-repository support with merged index  
> - Versioned packages with `latest` support  
> - `install.sh` to install your package, includes running the LSPM nestedly to grab your deps  
> - Swap-friendly, streamable, and highly portable  

---

## Installation

```sh
# Install
curl -fsSL https://raw.githubusercontent.com/lspm-pkg/lspm/refs/heads/main/install.sh | sh

# Bootstrap default repo
lspm set

# Update package list
lspm update
````

---

## Usage

### Package Operations

```sh
lspm add/install <package>[=<version>] [-y]    # Install a package
lspm upgrade <package> [-y]                    # Upgrade a package
lspm del/remove <package> [-y]                 # Remove a package
lspm list                                      # List installed packages
```

### Repository Commands

```sh
lspm add-remote <url>                     # Add a repository (aliases: add-r)
lspm remove-remote <url>                  # Remove a repository (aliases: del-r)
lspm list-remotes                         # List all repositories
lspm update                               # Fetch and merge indexes
lspm set                                  # Add default LSPM repo
```

### Developer Commands

```sh
lspm init <package>                       # Initialize a new package skeleton
```

---

## Package Structure

Every package follows this layout:

```
<package>/
  <version>/         # e.g., 2025-12-20 or latest
    install.sh       # Script to install the package
    remove.sh        # Script to remove the package
    date.txt         # Optional for "latest" versions
```

> * `latest` versions should include `date.txt` indicating the current version
> * Nested dependencies can be handled by calling LSPM within `install.sh`

---

## Example

```sh
lspm install hello       # Installs latest "hello" package
hello                    # Runs installed program
lspm remove hello        # Removes package
```

---

## Contributing

LSPM is designed to be forked and extended.
To create your own package:

```sh
lspm init mypackage      # Creates a skeleton package
```

> You can deploy your packages to the default mirror `mirror.5136.cloud` by making a ticket in the 5136.cloud Discord or via the website: [host.5136.cloud](https://host.5136.cloud)

For detailed guidelines, see the application development guide (link is broken temp).
