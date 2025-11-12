# LazyVim Configuration Summary

## Overview

This document summarizes the LazyVim configuration applied to support multi-language development for the sound-plugins-http project.

**Languages Supported:** C++, C#, Python, JavaScript, Protocol Buffers, CMake

**Date Configured:** 2025-11-12

---

## Configuration Files

### Core Config Files

| File | Purpose | Status |
|------|---------|--------|
| `lua/config/options.lua` | Editor behavior (indentation, search, splits) | ✅ Configured |
| `lua/config/keymaps.lua` | Custom keybindings | ✅ Using LazyVim defaults |
| `lua/config/autocmds.lua` | Auto-commands (auto-format, highlight yank) | ✅ Configured |
| `lua/config/lazy.lua` | Plugin manager configuration | ✅ LazyVim default |

### Language Plugin Files

| File | LSP | Formatter | Status |
|------|-----|-----------|--------|
| `lua/plugins/cpp.lua` | clangd | clang-format | ✅ Configured |
| `lua/plugins/csharp.lua` | OmniSharp | CSharpier | ✅ Configured |
| `lua/plugins/python.lua` | pyright | black, isort | ✅ Configured |
| `lua/plugins/javascript.lua` | ts_ls | prettier | ✅ Configured |
| `lua/plugins/protobuf.lua` | bufls | buf | ✅ Configured |
| `lua/plugins/cmake.lua` | cmake | cmake_format | ✅ Configured |

### Tool Plugin Files

| File | Purpose | Status |
|------|---------|--------|
| `lua/plugins/git.lua` | Git integration (gitsigns, LazyGit) | ✅ Configured |
| `lua/plugins/editor.lua` | Editor enhancements (Telescope, Neo-tree) | ✅ Configured |

---

## Essential Keybindings

### Leader Key
- `<leader>` = `Space`
- `<localleader>` = `\`

### General

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>w` | Save file | Write current buffer |
| `<leader>q` | Quit | Close current window |
| `<leader>?` | Show all keybindings | Open which-key help |

### Navigation

#### Window Navigation
| Keybinding | Action |
|------------|--------|
| `Ctrl-h` | Move to left window |
| `Ctrl-j` | Move to lower window |
| `Ctrl-k` | Move to upper window |
| `Ctrl-l` | Move to right window |

#### Buffer Navigation
| Keybinding | Action |
|------------|--------|
| `Shift-h` | Previous buffer |
| `Shift-l` | Next buffer |
| `<leader>bd` | Delete/close buffer |
| `<leader>fb` | List buffers (Telescope) |

#### File Navigation
| Keybinding | Action |
|------------|--------|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep / search in files |
| `<leader>fh` | Help tags |
| `<leader>/` | Search in current buffer |

### LSP Features (Language Server)

#### Code Navigation
| Keybinding | Action |
|------------|--------|
| `g d` | Go to definition |
| `g r` | Go to references |
| `g I` | Go to implementation |
| `g D` | Go to declaration |
| `Ctrl-o` | Jump back |
| `Ctrl-i` | Jump forward |

#### Code Information
| Keybinding | Action |
|------------|--------|
| `K` | Hover documentation |
| `<leader>cl` | LSP info / menu |
| `<leader>cd` | Show diagnostics |

#### Code Actions
| Keybinding | Action |
|------------|--------|
| `<leader>ca` | Code actions (quick fixes) |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format file/selection |

#### Diagnostics (Errors/Warnings)
| Keybinding | Action |
|------------|--------|
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<leader>xx` | Open diagnostics list |
| `<leader>xd` | Document diagnostics |

### Editing

#### Basic Editing
| Keybinding | Action |
|------------|--------|
| `gcc` | Toggle comment (current line) |
| `gc` (visual) | Toggle comment (selection) |
| `yy` | Yank (copy) line - will flash highlight |
| `p` | Paste after cursor |
| `P` | Paste before cursor |

#### Window Splits
| Keybinding | Action |
|------------|--------|
| `:vsplit` | Vertical split (opens right) |
| `:split` | Horizontal split (opens below) |
| `:only` | Close all splits except current |

### Git Integration

| Keybinding | Action |
|------------|--------|
| `<leader>gg` | Open LazyGit |
| `]h` | Next git hunk |
| `[h` | Previous git hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |

**Git Features:**
- Inline git blame at end of lines (after 300ms delay)
- Git signs in gutter (add, change, delete markers)
- Git-LFS auto-initialized on vim start

### Terminal

| Keybinding | Action |
|------------|--------|
| `Ctrl-\` | Toggle terminal |
| `Esc` (in terminal) | Exit terminal mode to normal mode |

### Python-Specific

| Keybinding | Action |
|------------|--------|
| `<leader>vs` | Select Python virtual environment |

### CMake-Specific

| Keybinding | Action |
|------------|--------|
| `<leader>cg` | CMake Generate |
| `<leader>cb` | CMake Build |
| `<leader>cr` | CMake Run |
| `<leader>cd` | CMake Debug |
| `<leader>cs` | CMake Select Build Type |
| `<leader>ct` | CMake Select Target |

### Debugging (C++)

| Keybinding | Action |
|------------|--------|
| `F5` | Continue / Start debugging |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |
| `<leader>db` | Toggle breakpoint |

---

## Auto-Commands (Automatic Behaviors)

### Highlight on Yank
**What:** Text briefly flashes/highlights when copied
**Trigger:** After yanking (copying) text

### Auto-Format on Save
**What:** Automatically formats code when saving
**Trigger:** Saving files with extensions: `.cpp`, `.h`, `.cs`, `.py`, `.js`, `.proto`, `.cmake`
**Formatters:**
- C/C++: clang-format
- C#: CSharpier
- Python: black + isort
- JavaScript: prettier
- Protocol Buffers: buf
- CMake: cmake_format

### Close with 'q'
**What:** Quickly close certain window types with just `q`
**Applies to:** Help windows, LSP info, quickfix lists, man pages

### CMake Auto-Regenerate
**What:** Automatically regenerates CMake project when CMakeLists.txt is saved
**Trigger:** Saving `CMakeLists.txt`
**Action:** Runs `cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`

### Protocol Buffers Settings
**What:** Automatically sets proper indentation for `.proto` files
**Trigger:** Opening `.proto` files
**Settings:** 2-space indentation, `//` comment style

---

## Editor Options

### Line Numbers
- Absolute and relative line numbers enabled
- Great for vim motions like `5j` (jump 5 lines down)

### Indentation
- Default: 4 spaces (respects `.editorconfig` overrides)
- Expandtab enabled (spaces instead of tabs)
- Smart indent enabled

### Search
- Case-insensitive by default
- Case-sensitive when search includes uppercase
- Smart case matching

### Splits
- Vertical splits open to the RIGHT
- Horizontal splits open BELOW

### File Handling
- No swap files
- Persistent undo enabled
- Undo history stored in `~/.local/share/nvim/undo`

### Wildignore Patterns
Excludes these from file searches:
- `build/` directories
- `thirdparty/` directories
- `node_modules/` directories
- Binary files: `.dll`, `.so`, `.dylib`, `.o`, `.obj`, `.bundle`

---

## LSP Servers Installed

| Language | LSP Server | Status |
|----------|------------|--------|
| C++ | clangd | ✅ Running |
| C# | OmniSharp | ✅ Running |
| Python | pyright | ✅ Configured |
| JavaScript | ts_ls (TypeScript) | ✅ Configured |
| Protocol Buffers | bufls | ✅ Configured |
| CMake | cmake | ✅ Configured |
| Lua | lua_ls | ✅ LazyVim default |

**Check LSP status:** Type `:LspInfo` in any file

---

## Plugin Manager Commands

| Command | Purpose |
|---------|---------|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Install/update all plugins |
| `:Lazy update` | Update plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy check` | Check for plugin updates |

---

## Useful Vim Commands

### Help System
| Command | Purpose |
|---------|---------|
| `:help <topic>` | Open help for topic |
| `:help keybindings` | General keybinding help |
| `:Telescope help_tags` | Search help with fuzzy finder |

### Settings
| Command | Purpose |
|---------|---------|
| `:set <option>?` | Check current value (e.g., `:set tabstop?`) |
| `:set <option>=<value>` | Set value (e.g., `:set tabstop=2`) |
| `:pwd` | Print working directory |
| `:cd <path>` | Change directory |

### LSP
| Command | Purpose |
|---------|---------|
| `:LspInfo` | Show LSP status for current buffer |
| `:LspRestart` | Restart LSP server |
| `:LspLog` | View LSP logs |

### Mason (LSP/Formatter Manager)
| Command | Purpose |
|---------|---------|
| `:Mason` | Open Mason UI |
| `:MasonUpdate` | Update Mason registries |
| `:MasonInstall <tool>` | Install LSP/formatter |

---

## Testing Checklist

Use this checklist to verify everything is working:

### Basic Editor
- [ ] Line numbers visible (absolute + relative)
- [ ] `:vsplit` opens split to the right
- [ ] `:split` opens split below
- [ ] `Ctrl-h/j/k/l` moves between windows

### C++ Development
- [ ] Open a `.cpp` file
- [ ] `:LspInfo` shows clangd is running
- [ ] `gd` goes to definition
- [ ] `K` shows hover documentation
- [ ] `<leader>cf` formats the file
- [ ] Saving auto-formats code

### C# Development (Unity)
- [ ] Open a `.cs` file
- [ ] `:LspInfo` shows OmniSharp is running
- [ ] IntelliSense/autocomplete works
- [ ] `gd` goes to definition
- [ ] Saving auto-formats code

### Python Development
- [ ] Open a `.py` file
- [ ] `:LspInfo` shows pyright is running
- [ ] Type checking works
- [ ] `<leader>vs` opens venv selector

### Git Integration
- [ ] Git blame visible at end of lines
- [ ] Git signs in gutter (add/change markers)
- [ ] `<leader>gg` opens LazyGit

### File Navigation
- [ ] `<leader>e` toggles file tree
- [ ] `<leader>ff` opens file finder
- [ ] `<leader>fg` searches in files

### Auto-Commands
- [ ] Yanking text (`yy`) shows highlight flash
- [ ] Saving `.cpp` file auto-formats
- [ ] `:help` then `q` closes help window
- [ ] Saving `CMakeLists.txt` shows regeneration notification

---

## Troubleshooting

### LSP Not Working

**Check LSP status:**
```
:LspInfo
```

**Restart LSP:**
```
:LspRestart
```

**Check Mason installations:**
```
:Mason
```

### Formatter Not Working

**Check if formatter is installed:**
```
:Mason
```

**Manually format:**
```
:lua require("conform").format()
```

### CMake Issues

**Generate compile_commands.json manually:**
```bash
cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

### Python Virtual Environment

**Select venv:**
```
<leader>vs
```

**Or set manually in project:**
```lua
vim.g.python3_host_prog = ".venv/bin/python"
```

---

## Git Commits Made

All configuration changes have been committed to your dotfiles repo at `~/.cfg/`:

1. `nvim: update lazy-lock.json with current plugin versions`
2. `nvim: add project-specific options (editorconfig, indentation, search, splits)`
3. `nvim: add C++ plugin config with clangd, cmake-tools, and debugging`
4. `nvim: add autocmds (highlight yank, auto-format, cmake integration)`
5. `nvim: add C# plugin config with OmniSharp LSP and CSharpier formatting`
6. `nvim: add Python plugin config with pyright LSP, black/isort formatting, and venv support`
7. `nvim: add JavaScript plugin config with ts_ls LSP and prettier formatting`
8. `nvim: add Protocol Buffers plugin config with bufls LSP and buf formatting`
9. `nvim: add CMake plugin config with cmake LSP and cmake_format formatting`
10. `nvim: add Git plugin config with gitsigns, git-lfs, and lazygit integration`
11. `nvim: add editor enhancements (telescope, neo-tree, toggleterm, project management)`

**View commits:**
```bash
git --git-dir=$HOME/.cfg/ --work-tree=$HOME log --oneline --since="2025-11-12"
```

---

## Next Steps / Learning Resources

### Learning Vim Motions
- `:Tutor` - Built-in Vim tutorial
- Practice using relative line numbers with motions like `5j`, `10k`
- Learn text objects: `ciw` (change inner word), `di"` (delete inside quotes)

### LazyVim Documentation
- Official docs: https://www.lazyvim.org/
- Keybindings reference: Press `<leader>?` in nvim

### Which-Key
- Press `<leader>` and wait - shows available keybindings
- Press any key prefix (like `<leader>c`) and wait - shows sub-menu

### Advanced Features to Explore
- **Telescope:** Advanced searching and filtering
- **LazyGit:** Full git interface in nvim
- **DAP:** Debugging C++ code with breakpoints
- **Snippets:** Code snippet expansion
- **Treesitter:** Advanced syntax highlighting

---

## Quick Reference Card

**Most Used Commands:**

```
Navigation:           Files:               LSP:
  gd    - definition    <leader>e - tree    K      - docs
  gr    - references    <leader>ff - find   <leader>ca - actions
  Ctrl-o - back        <leader>fg - grep   <leader>cr - rename
  ]d    - next error   <leader>fb - bufs   <leader>cf - format

Git:                  Editing:            Terminal:
  <leader>gg - lazygit  gcc - comment       Ctrl-\ - toggle
  ]h - next hunk        yy  - copy line     Esc    - exit mode
  [h - prev hunk        p   - paste

Windows:             Buffers:            Help:
  Ctrl-hjkl - move    Shift-h - prev      <leader>? - keys
  :vsplit   - vert    Shift-l - next      :help <topic>
  :split    - horiz   <leader>bd - close  :LspInfo
```

---

**Configuration Complete! Happy Coding! 🚀**
