
# vim-gitcommit

Git commit with Markdown/JIRA/... syntax highlighting

## Usage

For use with custom settings, add to your configuration file:

```vim
" Plugin GentleFly/vim-gitcommit
let g:gitcommit#cchar  = ";"
let g:gitcommit#syntax = "markdown"
```

Not forget set settings git:

```bash
git config [--global] core.commentChar ";"
```

