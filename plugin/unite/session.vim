"=============================================================================
" FILE: session.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu@gmail.com>
" Last Modified: 05 Oct 2010
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

if exists('g:loaded_unite_source_session')
      \ || $SUDO_USER != '' || v:version < 703
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

let g:unite_source_session_enable_auto_save =
      \ get(g:, 'unite_source_session_enable_auto_save', 0)

command! -nargs=? -complete=customlist,unite#sources#session#_complete
      \ UniteSessionSave call unite#sources#session#_save(<q-args>)

command! -nargs=? -complete=customlist,unite#sources#session#_complete
      \ UniteSessionLoad call unite#sources#session#_load(<q-args>)

if g:unite_source_session_enable_auto_save
  augroup plugin-unite-source-session
    autocmd!
    autocmd CursorHold *
          \ if v:this_session != '' | call unite#sources#session#_save('') | endif
  augroup END
endif

" Variables  "{{{
call unite#util#set_default('g:unite_source_session_default_session_name',
      \ 'default')
call unite#util#set_default('g:unite_source_session_options',
      \ 'buffers,curdir,folds,help,winsize')
call unite#util#set_default('g:unite_source_session_path',
      \ g:unite_data_directory . '/session')
call unite#util#set_default(
      \ 'g:unite_source_session_enable_beta_features', 0)
"}}}

let g:loaded_unite_source_session = 1

let &cpo = s:save_cpo
unlet s:save_cpo

" __END__
" vim: foldmethod=marker
