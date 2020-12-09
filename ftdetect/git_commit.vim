" Language:   Git Commit Message (with Markdown)
" Maintainer: Michael Howell <michael@notriddle.com>
" URL:        https://github.com/notriddle/vim-gitcommit-markdown
" License:    VIM License

autocmd BufNewFile,BufRead */COMMIT_EDITMSG set ft=git_commit
autocmd BufNewFile,BufRead */MERGE_MSG      set ft=git_commit

