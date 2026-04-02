## Overview

This config uses **neovim** with the following stack:

| Concern | Plugin |
|---|---|
| Plugin manager | [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-installs on first run) |
| Completion | nvim-cmp + cmp-nvim-lsp + LuaSnip |
| LSP | nvim-lspconfig (gopls for Go, nil_ls for Nix) |
| Syntax / folding | nvim-treesitter |
| File tree | NERDTree |
| Fuzzy find | fzf + fzf.vim |
| Go | vim-go (build/test/run/coverage) + gopls via LSP |
| Debugging | nvim-dap + nvim-dap-go + nvim-dap-ui |
| Git | vim-gitgutter, vim-fugitive |
| Status bar | vim-airline |

---

## Migration history

### Vundle → lazy.nvim

Previously this config used [Vundle](https://github.com/VundleVim/Vundle.vim) as the plugin manager. Vundle required a manual bootstrap step (`git clone` into `~/.vim/bundle/`) and a separate `:PluginInstall` run inside nvim before anything worked. On a fresh machine this meant editors errors on every open until you did the setup.

[lazy.nvim](https://github.com/folke/lazy.nvim) auto-bootstraps itself on first open — it clones itself if not present, then installs all plugins automatically. No manual steps needed.

### coc.nvim → nvim-lspconfig + nvim-cmp

coc.nvim required Node.js and yarn to build, and had its own separate config file (`coc-settings.json`). It has been replaced with:

- **nvim-lspconfig** — configures LSP servers (gopls, nil_ls) using neovim's native LSP client
- **nvim-cmp** — completion engine that sources from LSP, snippets, etc.

This removes the Node.js dependency entirely and keeps all config in a single `vimrc`.

### nvim 0.11 native LSP API

nvim 0.11 introduced a new native API for configuring LSP servers: `vim.lsp.config()` and `vim.lsp.enable()`. This replaces the older `require('lspconfig').gopls.setup({})` pattern from nvim-lspconfig.

Before (pre-0.11):
```lua
require('lspconfig').gopls.setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr) ... end,
})
```

After (0.11+):
```lua
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  capabilities = capabilities,
})
vim.lsp.enable('gopls')
```

Key bindings (gd, gr, gi, K etc.) are now registered via a single `LspAttach` autocmd instead of per-server `on_attach` callbacks.

---

## Install

### 1. Symlink vimrc

```sh
ln -sf ~/path/to/dotfiles/vim/vimrc ~/.vimrc
```

### 2. Set up nvim to use vimrc

Add the following to `~/.config/nvim/init.vim`:

```vim
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
```

### 3. Open nvim

lazy.nvim will auto-install all plugins on the first open. After it finishes, restart nvim.

---

## Per-environment setup

### Ubuntu / Debian

**Fonts (for vim-airline powerline symbols):**

```sh
sudo apt-get install fonts-powerline
```

**gopls (Go LSP):**

```sh
go install golang.org/x/tools/gopls@latest
```

Make sure `$GOBIN` (or `$GOPATH/bin`) is in your `$PATH`.

**Nix LSP + formatter:**

```sh
# nil and nixpkgs-fmt are not in apt — install via cargo
cargo install nil
cargo install nixpkgs-fmt
```

**Treesitter parsers** — install after opening nvim:

```
:TSInstall bash go hcl json make yaml
```

### NixOS

Add to `configuration.nix`:

```nix
environment.systemPackages = with pkgs; [
  neovim
  gopls
  nil
  nixpkgs-fmt
  (vimPlugins.nvim-treesitter.withPlugins (p: [ p.go p.lua p.vim p.bash p.json p.yaml ]))
];
```

Then:

```sh
sudo nixos-rebuild switch
```

### macOS

**Fonts:**

Copy fonts from the `./fonts` dir to `~/Library/Fonts`.

If you have issues with devicons fonts, follow:
https://github.com/ryanoasis/vim-devicons/issues/198#issuecomment-338769056

**gopls:**

```sh
go install golang.org/x/tools/gopls@latest
```

---

## Key bindings

| Key | Action |
|---|---|
| `,` | Leader key |
| `Ctrl+p` | Fuzzy file search (fzf) |
| `Ctrl+q` | Toggle NERDTree |
| `Ctrl+n` / `Ctrl+m` | Next / previous quickfix error |
| `,a` | Close quickfix |
| `,b` | Build Go file / test |
| `,r` | Go run |
| `,t` | Go test |
| `,c` | Go coverage toggle |
| `,gs` | Git status |
| `,gp` | Git pull |
| `,gP` | Git push |
| `,gl` | Git log |
| `,tb` | DAP toggle breakpoint |
| `,tc` | DAP continue |
| `,tt` | DAP terminate |
| `,td` | DAP debug test (Go) |
| `gd` | Go to definition (LSP) |
| `gy` | Go to type definition (LSP) |
| `gi` | Go to implementation (LSP) |
| `gr` | Go to references (LSP) |
| `K` | Hover documentation (LSP) |
| `F7` | Auto-indent entire file |

---

## Go workflow

vim-go handles build/test/run. LSP (gopls) handles completion, imports, diagnostics, and formatting on save. To avoid conflicts, vim-go's own gopls integration is disabled — gopls runs exclusively through nvim-lspconfig.

On save (`.go` files): gofmt + goimports run automatically via LSP.

## Nix workflow

On save (`.nix` files): `nixpkgs-fmt` runs automatically via nil_ls. Requires `nil` and `nixpkgs-fmt` to be installed.

## Debugging (Go)

Uses nvim-dap + nvim-dap-go + nvim-dap-ui. The UI opens automatically when a debug session starts and closes when it ends. Delve is used as the backend — install it with:

```sh
go install github.com/go-delve/delve/cmd/dlv@latest
```
