# 🧭 Disable Tabs in IntelliJ for a Vim-like Single-Buffer Workflow

## ✅ Steps to Disable Tabs

1. **Open Settings / Preferences**

   > `File → Settings` (or `Ctrl+Alt+S`)

2. **Navigate to Editor Tabs**

   > `Editor → General → Editor Tabs`

3. **Adjust These Settings:**

   - **Tab placement:** `None`
   - **Open new tabs:** _Uncheck_ all options like:
     - ✅ `Open in preview tab if possible`
     - ❌ `Open declaration source in the same tab`
   - **Close tabs:** Set to `Close non-modified files first` (helps keep only one buffer open at a time)

---

## 📝 Optional `.ideavimrc` for Window Control

Add the following to your `~/.ideavimrc` to enable more Vim-like split behavior:

```vim
" Close current split (like <C-w>q)
nnoremap <C-w>q :action Unsplit<CR>
```
