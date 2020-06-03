" Vim syntax file
" Language:	git commit file
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Filenames:	*.git/COMMIT_EDITMSG
" Last Change:	2016 Aug 29

let g:gitcommit_cchar=";"
let g:gitcommit_cchar = get(g:, 'gitcommit_cchar', "#")


if exists('b:current_syntax') && b:current_syntax == 'git_commit'
  finish
endif

syn case match
syn sync minlines=50

if has("spell")
  syn spell toplevel
endif

runtime! syntax/markdown.vim
unlet b:current_syntax

syn include @markdown syntax/markdown.vim
syn include @gitcommitDiff syntax/diff.vim
exec 'syn region gitcommitDiff start=/\%(^diff --\%(git\|cc\|combined\) \)\@=/ end=/^\%(diff --\|$\|'.g:gitcommit_cchar.'\)\@=/ fold contains=@gitcommitDiff'

exec 'syn match   gitcommitFirstLine	"\%^[^'.g:gitcommit_cchar.'].*"  nextgroup=gitcommitBlank skipnl'
syn match   gitcommitSummary	"^.\{0,50\}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell
syn match   gitcommitOverflow	".*" contained contains=@markdown
exec 'syn match   gitcommitBlank	"^[^'.g:gitcommit_cchar.'].*" contained contains=@Spell'
exec 'syn match   gitcommitComment	"^'.g:gitcommit_cchar.'.*"'
exec 'syn match   gitcommitHead	"^\%('.g:gitcommit_cchar.'   .*\n\)\+;$" contained transparent'
exec 'syn match   gitcommitOnBranch	"\%(^'.g:gitcommit_cchar.' \)\@<=On branch" contained containedin=gitcommitComment nextgroup=gitcommitBranch skipwhite'
exec 'syn match   gitcommitOnBranch	"\%(^'.g:gitcommit_cchar.' \)\@<=Your branch .\{-\} '."'\" contained containedin=gitcommitComment nextgroup=gitcommitBranch skipwhite"
syn match   gitcommitBranch	"[^ ']\+" contained
exec 'syn match   gitcommitNoBranch	"\%(^'.g:gitcommit_cchar.' \)\@<=Not currently on any branch." contained containedin=gitcommitComment'
exec 'syn match   gitcommitHeader	"\%(^'.g:gitcommit_cchar.' \)\@<=.*:$"	contained containedin=gitcommitComment'
exec 'syn region  gitcommitAuthor	matchgroup=gitCommitHeader start=/\%(^'.g:gitcommit_cchar.' \)\@<=\%(Author\|Committer\):/ end=/$/ keepend oneline contained containedin=gitcommitComment transparent'
exec 'syn match   gitcommitNoChanges	"\%(^'.g:gitcommit_cchar.' \)\@<=No changes$" contained containedin=gitcommitComment'

exec 'syn region  gitcommitUntracked	start=/^'.g:gitcommit_cchar.' Untracked files:/ end=/^;$\|^;\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitUntrackedFile fold'
syn match   gitcommitUntrackedFile  "\t\@<=.*"	contained

exec 'syn region  gitcommitDiscarded	start=/^'.g:gitcommit_cchar.' Change\%(s not staged for commit\|d but not updated\):/ end=/^;$\|^;\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitDiscardedType fold'
exec 'syn region  gitcommitSelected	start=/^'.g:gitcommit_cchar.' Changes to be committed:/ end=/^;$\|^;\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitSelectedType fold'
exec 'syn region  gitcommitUnmerged	start=/^'.g:gitcommit_cchar.' Unmerged paths:/ end=/^;$\|^;\@!/ contains=gitcommitHeader,gitcommitHead,gitcommitUnmergedType fold'


syn match   gitcommitDiscardedType	"\t\@<=[[:lower:]][^:]*[[:lower:]]: "he=e-2	contained containedin=gitcommitComment nextgroup=gitcommitDiscardedFile skipwhite
syn match   gitcommitSelectedType	"\t\@<=[[:lower:]][^:]*[[:lower:]]: "he=e-2	contained containedin=gitcommitComment nextgroup=gitcommitSelectedFile skipwhite
syn match   gitcommitUnmergedType	"\t\@<=[[:lower:]][^:]*[[:lower:]]: "he=e-2	contained containedin=gitcommitComment nextgroup=gitcommitUnmergedFile skipwhite
syn match   gitcommitDiscardedFile	".\{-\}\%($\| -> \)\@=" contained nextgroup=gitcommitDiscardedArrow
syn match   gitcommitSelectedFile	".\{-\}\%($\| -> \)\@=" contained nextgroup=gitcommitSelectedArrow
syn match   gitcommitUnmergedFile	".\{-\}\%($\| -> \)\@=" contained nextgroup=gitcommitSelectedArrow
syn match   gitcommitDiscardedArrow	" -> " contained nextgroup=gitcommitDiscardedFile
syn match   gitcommitSelectedArrow	" -> " contained nextgroup=gitcommitSelectedFile
syn match   gitcommitUnmergedArrow	" -> " contained nextgroup=gitcommitSelectedFile

exec 'syn match   gitcommitWarning		"\%^[^'.g:gitcommit_cchar.'].*: needs merge$" nextgroup=gitcommitWarning skipnl'
exec 'syn match   gitcommitWarning		"^[^'.g:gitcommit_cchar.'].*: needs merge$" nextgroup=gitcommitWarning skipnl contained'
syn match   gitcommitWarning		"^\%(no changes added to commit\|nothing \%(added \)\=to commit\)\>.*\%$"

hi def link gitcommitSummary		Keyword
hi def link gitcommitComment		Comment
hi def link gitcommitUntracked		gitcommitComment
hi def link gitcommitDiscarded		gitcommitComment
hi def link gitcommitSelected		gitcommitComment
hi def link gitcommitUnmerged		gitcommitComment
hi def link gitcommitOnBranch		Comment
hi def link gitcommitBranch		Special
hi def link gitcommitNoBranch		gitCommitBranch
hi def link gitcommitDiscardedType	gitcommitType
hi def link gitcommitSelectedType	gitcommitType
hi def link gitcommitUnmergedType	gitcommitType
hi def link gitcommitType		Type
hi def link gitcommitNoChanges		gitcommitHeader
hi def link gitcommitHeader		PreProc
hi def link gitcommitUntrackedFile	gitcommitFile
hi def link gitcommitDiscardedFile	gitcommitFile
hi def link gitcommitSelectedFile	gitcommitFile
hi def link gitcommitUnmergedFile	gitcommitFile
hi def link gitcommitFile		Constant
hi def link gitcommitDiscardedArrow	gitcommitArrow
hi def link gitcommitSelectedArrow	gitcommitArrow
hi def link gitcommitUnmergedArrow	gitcommitArrow
hi def link gitcommitArrow		gitcommitComment
"hi def link gitcommitOverflow		Error
hi def link gitcommitBlank		Error

let b:current_syntax = "git_commit"
