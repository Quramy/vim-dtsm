"============================================================================
" FILE: autoload/vim_dtsm.vim
" AUTHOR: Quramy <yosuke.kurami@gmail.com>
"============================================================================

scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! vim_dtsm#init()
  let stdout = systemlist('dtsm init')
  if len(stdout)
    " write dtsm.json
    echo stdout[0]
  endif
endfunction

function! vim_dtsm#fetch()
  echo 'fetching...'
  let stdout = systemlist('dtsm fetch')
  if len(stdout) > 1
    " fetching  xxx/yyy
    echo stdout[1]
  endif
endfunction

function! vim_dtsm#install(...)
  let type_file_list = map(range(1, a:{0}), 'a:{v:val}')
  let stdouts = systemlist('dtsm install '.join(type_file_list, ' ').' --save')
  if len(stdouts)
    echo join(stdouts, ', ')
  endif
endfunction

function! vim_dtsm#uninstall(...)
  let type_file_list = map(range(1, a:{0}), 'a:{v:val}')
  let stdouts = systemlist('dtsm uninstall '.join(type_file_list, ' ').' --save')
  if len(stdouts)
    echo join(stdouts, ', ')
  endif
endfunction

function! vim_dtsm#update()
  let stdouts = systemlist('dtsm update')
  if len(stdouts)
    echo join(stdouts, ', ')
  endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo


