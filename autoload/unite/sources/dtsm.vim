"============================================================================
" FILE: autoload/unite/sources/dtsm.vim
" AUTHOR: Quramy <yosuke.kurami@gmail.com>
"============================================================================

scriptencoding utf-8

let s:source = {
      \ 'name': 'dtsm',
      \ 'description': 'TypeScript project information',
      \ }

function! s:source.gather_candidates(args, context)
  echo join(a:args, ' ')
  let stdouts = systemlist('dtsm search '.join(a:args, ' '))
  let result = []
  if len(stdouts) < 3
    return
  endif
  call remove(stdouts, 0, 1)
  for type_file_name in stdouts
    call add(result, {
          \ 'word': type_file_name,
          \ 'kind': 'command',
          \ 'source': 'dtsm',
          \ 'action__command': 'DtsmInstall '.type_file_name
          \ })
  endfor
  return result
endfunction

function! unite#sources#dtsm#define()
  return s:source
endfunction

