
function! BranchName()
  let l:repo = substitute(system('basename $(git rev-parse --show-toplevel)'), '\n', '', '')
  let l:branch = substitute(system('git rev-parse --abbrev-ref HEAD'), '\n', '', '')
  return g:wiki . l:repo . '-'. l:branch .'.md'
endfun


" get branch name 
function! BranchNotes()

  let l:repo = substitute(system('basename $(git rev-parse --show-toplevel) '), '\n', '', '')
  let l:branch = substitute(system('git rev-parse --abbrev-ref HEAD'), '\n', '', '')

  let l:cmd = g:wiki . l:repo . '-'. l:branch .'.md'
  call ToggleBuf(l:cmd)

endfun

"  open notes pertaining to the repository as a whole 
function! RepoNotes()
  let l:repo = substitute(system('echo $(git rev-parse --show-toplevel) | sed -e "s/\//-/g" -e "s/-//"'), '\n', '', '')
  let l:cmd = g:meta . l:repo . '.md'
  call ToggleBuf(l:cmd)
endfun
function! RepoTasks()
  let l:repo = substitute(system('echo $(git rev-parse --show-toplevel) | sed -e "s/\//-/g" -e "s/-//"'), '\n', '', '')
  let l:cmd = g:meta . l:repo . '-tasks.md'
  call ToggleBuf(l:cmd)
endfun

command! -nargs=* BranchNotes call BranchNotes()<CR>
command! -nargs=0 RepoNotes silent call RepoNotes()<CR>
command! -nargs=0 RepoTasks silent call RepoTasks()<CR>

