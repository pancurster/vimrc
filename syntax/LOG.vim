" Vim syntax file
" Language:     LOG
" Maintainer:   Łukasz Panek
" Last Change:  10 sie 2014
" Version:      0.1
"
if exists("b:current_syntax")
    finish
endif

if version < 600
  syntax clear
endif

let b:current_syntax = "plantuml"

setlocal iskeyword+=:
syn case match

syn keyword errOcur   ERR
syn keyword wrnOcur   WRN
syn region confOcur  start=/CONF,/ end=/\n/
syn region confDeep  start=/CONF_DEEPER,/ end=/\n/
syn region dbChange  start=/DB_CHANGE_LOG,/ end=/\n/

highlight link errOcur  Error
highlight link wrnOcur  WarningMsg
highlight link confOcur Statement
highlight link confDeep Special
highlight link dbChange Function
