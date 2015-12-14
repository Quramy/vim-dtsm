"============================================================================
" FILE: plugin/vim_dtsm.vim
" AUTHOR: Quramy <yosuke.kurami@gmail.com>
"============================================================================

scriptencoding utf-8

" Preprocessing {{{
if exists('g:loaded_vim_dtsm')
  finish
endif

let g:loaded_vim_dtsm = 1

let s:save_cpo = &cpo
set cpo&vim
" Preprocessing }}}

command!              DtsmInit      :call vim_dtsm#init()
command!              DtsmFetch     :call vim_dtsm#fetch()
command! -nargs=+     DtsmInstall   :call vim_dtsm#install(<f-args>)
command! -nargs=+     DtsmUninstall :call vim_dtsm#uninstall(<f-args>)
command!              DtsmUpdate    :call vim_dtsm#update()

let &cpo = s:save_cpo
unlet s:save_cpo
