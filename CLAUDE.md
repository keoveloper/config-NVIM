# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **LazyVim-based Neovim configuration**. It uses `lazy.nvim` for plugin management with LazyVim as the base distribution, then layers custom plugins and overrides on top.

## Architecture

- **`init.lua`** — Entry point. Sets up `vim.loader`, a global debug helper (`_G.dd`), loads `config.lazy`, and configures `code_runner.nvim` executors (Java, Python, TypeScript/Deno, Rust, C).
- **`lua/config/lazy.lua`** — Bootstraps `lazy.nvim`, imports LazyVim base + extras, and defines standalone plugins (mcphub, rest.nvim, emmet, copilot, code_runner, etc.). LazyVim extras for specific languages/tools are imported here AND in `lazyvim.json`.
- **`lua/config/options.lua`** — Editor options. Leader is `<Space>`, 2-space indentation, shell is `zsh`. Defines custom filetypes (`.astro` → astro, `Podfile` → ruby).
- **`lua/config/keymaps.lua`** — Custom keybindings (splits, tabs, insert-mode shortcuts like `jk` to exit, REST runner, diagnostics nav).
- **`lua/config/autocmds.lua`** — Auto-commands (paste mode off on InsertLeave, conceallevel=0 for json/markdown).
- **`lua/plugins/`** — Per-concern plugin specs that override or extend LazyVim defaults:
  - `blink-cmp.lua` — Completion engine with LSP, snippets (`;` prefix trigger), path, buffer, emoji, dadbod sources.
  - `lsp-config.lua` — LSP overrides (inlay hints disabled, harper-ls for markdown, csharp_ls).
  - `mason.lua` — Extra LSP/tool installs (templ, html-lsp, htmx-lsp, tailwindcss, harper-ls).
  - `luasnip.lua` — Extensive custom snippets: markdown blog/video templates, code blocks for 20+ languages, YouTube video list integration.
  - `coding.lua` — Neogen docs, inc-rename, refactoring, dial.nvim (booleans/semver/dates), symbols-outline.
  - `editor.lua` — Telescope bindings (`;f` files, `;r` grep, `\\` buffers, `sf` browser), git.nvim, mini.hipatterns.
  - `ui.lua` — Noice, notify, snacks dashboard, bufferline, lualine, zen-mode, precognition, smear-cursor.
  - `themes/` — Colorscheme configs. Active: **tokyodark** with italicized comments/keywords.

## Key Conventions

- **LazyVim extras** are enabled in two places: `lazyvim.json` (UI-managed) and `lua/config/lazy.lua` (code-managed imports like eslint, prettier, typescript, rust, tailwind).
- **Snippet trigger prefix** is `;` — snippets activate when typed after `;`.
- **Auto-save** is enabled (`auto-save.nvim`) with smart conditions (disabled for harpoon, MySQL buffers, active snippets).
- **TMUX integration** via `nvim-tmux-navigation` (`<C-h/j/k/l>` for pane movement).

## Working with This Config

- Plugin versions are locked in `lazy-lock.json`. After changing plugin specs, open Neovim and run `:Lazy sync`.
- To add a new plugin, create or edit a file in `lua/plugins/` returning a lazy.nvim plugin spec table.
- To enable a LazyVim extra, either add it to `lazyvim.json` extras array or import it in `lua/config/lazy.lua`.
- LSP servers are managed through Mason (`lua/plugins/mason.lua`) and configured in `lua/plugins/lsp-config.lua`.

## Languages Supported

TypeScript, JavaScript, Python, Rust, Java, PHP, SQL, Go, C/C++, HTML/CSS, Tailwind, Lua, Markdown, Astro, Templ, HTMX, Docker, GLSL.
