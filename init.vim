call plug#begin()

" ============================================================================
" editing_stuff
" ============================================================================

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Recover.vim' " so I get a diff when there's a swap file
Plug 'sickill/vim-pasta' " context aware pasting
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-capslock'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/rainbow_parentheses.vim'

" ============================================================================
" searching_stuff
" ============================================================================

Plug 'henrik/vim-indexed-search' " number for / search
Plug 'ervandew/supertab' " tab completion
Plug 'dyng/ctrlsf.vim' " find and replace in multiple files
Plug 'soramugi/auto-ctags.vim' " automatically update ctags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ============================================================================
" navigation
" ============================================================================

Plug 'ton/vim-bufsurf' " recent buffer
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/BufOnly.vim'

" ============================================================================
" git_stuff
" ============================================================================

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'
Plug 'jreybert/vimagit'

" ============================================================================
" make_it_look_pretty
" ============================================================================
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'

" ============================================================================
" language_stuff
" ============================================================================

Plug 'neomake/neomake'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/gem-browse', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'alvan/vim-closetag' " close html tags
Plug 'elzr/vim-json' " json syntax and highlighting
Plug 'pangloss/vim-javascript' " js syntax highlighting
Plug 'mxw/vim-jsx' " javascript
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rizzatti/dash.vim'
Plug 'elixir-lang/vim-elixir'

" ============================================================================
" testing
" ============================================================================

Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
Plug 'radenling/vim-dispatch-neovim'

call plug#end()

" ============================================================================
" general_stuff
" ============================================================================

let mapleader = "," " set <leader> equal to ,

set clipboard=unnamed "fix copy-paste issues

set wildmode=longest,list,full " set wildmenu options
set wildmenu " see list for potential autocomplete options

set splitright " open new splits on the right
set splitbelow " open new splits below

set textwidth=72 " set wrap width
set formatoptions+=t " set format options to use textwidth

set mouse=nicr " make it easier for other people to scroll on my machine

nmap <leader>h :Helptags<CR>

nmap <leader>f :echo @%<CR>

nmap <leader>ss :w<CR>:terminal<CR>
vmap <leader>ss <ESC>:w<CR>:terminal<CR>
imap <leader>ss <ESC>:w<CR>:terminal<CR>

map <silent><leader>so :silent so ~/.config/nvim/init.vim<CR>:echo 'init.vim resourced'<CR>

" saving

inoremap <ESC> <ESC>`^
vnoremap <C-c> <ESC>:w<CR>
nnoremap <C-c> <ESC>:w<CR>
inoremap <C-c> <ESC>:w<CR>

nmap <leader>w :w<CR> " save V
vmap <leader>w <ESC>:w<CR>v
imap <leader>w <ESC>:w<CR>

nmap <leader>q :q<CR> " quit V
vmap <leader>q <ESC>:q<CR>
imap <leader>q <ESC>:q<CR>

nmap <leader>x :x<CR> " save & exit V
vmap <leader>x <ESC>:x<CR>
imap <leader>x <ESC>:x<CR>

noremap = =:w<CR>

" ============================================================================
" editing_stuff
" ============================================================================

set tabstop=2 shiftwidth=2 expandtab " automatically set the shift width

filetype plugin on " automatically close tags in various languages
set omnifunc=syntaxcomplete#Complete " closes tags

set hidden " keep edit history on hidden buffers
set directory=~/.vimswap " define which directory to save swap files

" au CursorHold * silent! update " save automatically when text is changed

set backspace=2 " make backspace work like most other apps

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace() " Removes trailing spaces

nnoremap <Leader>/ :%s/
vnoremap <Leader>/ y:%s/'<C-r>"'/

                          " the below abbreviation helps me remember
                          " the syntax is for copying the current file
                          " into the current directory
cnoreabbrev sav sav %:h/

au BufEnter *.rb syn match error contained "\<binding.pry\>" " show binding.pry
" au BufEnter *.js *.jsx syn match error contained "\<debugger\>" " highlight debugger

let g:move_key_modifier = 'C'

noremap <leader>bo :BufOnly<CR>

" snippets

let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>q"
let g:UltiSnipsJumpBackwardTrigger="<leader><tab>Q"

" ============================================================================
" searching_stuff
" ============================================================================

set ignorecase " ignores case for searching
set smartcase " doesn't ignore case when upper case used
set incsearch " automatically go to the word while searching
set hlsearch " highlights all search matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " turn off highlight

" ctrlsf

nnoremap <C-F> :CtrlSF
vnoremap <C-F> y:w<CR>:CtrlSF '<C-r>"'<CR>:%s/<C-r>"/
vnoremap <C-f> y:CtrlSF <C-r>"<CR>/<C-r>"<CR>

" fzf

noremap <silent><C-p> :silent GFiles<CR>
noremap <silent><C-a> :silent FZF<CR>
nnoremap <silent><C-b> :silent Buffers<CR>
noremap <LEADER>/ :silent BLines<CR>

let g:fzf_history_dir = '~/.local/share/fzf-history' " sets up command history
autocmd VimEnter * command! -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path 400 --color-line-number 400', fzf#vim#default_layout) " fixes ag colors

nnoremap <Leader>aa :Ag<Space>
vnoremap <Leader>aa y:Ag <C-r>"<CR>
nnoremap <Leader>ad :Ag<Space>def<space>
vnoremap <Leader>ad y:Ag<Space>def<space><C-r>"<CR>

" ============================================================================
" navigation
" ============================================================================

nmap <silent><S-Tab> :silent bp<CR>
nmap <silent><Tab> :silent bn<CR>

" bufsurf

nmap <silent><BS> :silent BufSurfBack<CR>
nmap <silent>\ :silent BufSurfForward<CR>

" tags

let g:auto_ctags = 1
set tags=tags " speeds up tags in neovim
set path=. " speeds up tags in neovim

" NERD

map <leader>ee :NERDTreeToggle<CR>
map <leader>ef :NERDTreeFind<CR>
let g:NERDShutUp = 1
let g:NERDDefaultNesting = 1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=0
let NERDTreeKeepTreeInNewTab=0
let NERDTreeMinimalUI=1

" ============================================================================
" git_stuff
" ============================================================================

" Assuming your remote is origin and you don't have unpushed commits on your copy of master:
" git fetch
" git rebase origin/master
" Edit: if you want to update your local copy of master as well, also assuming no unpushed commits on it, you can do a git fetch origin master:master instead of just a git fetch.

set diffopt+=vertical " fugitive make vertical

map <leader>gg :Gstatus<CR>

map <leader>gs :Git stash<CR>
map <leader>gsp :Git stash pop<CR>

map <leader>gw :Gwrite<CR>
map <leader>gr :Gread<CR>

let g:magit_discard_untracked_do_delete=1

map <leader>gd<SPACE> :Gdiff<SPACE>
map <leader>gdm :Gdiff master<CR>

map <leader>gb :Gblame<CR>

" rewriting_history

map <leader>gri :Git rebase -i HEAD~
map <leader>gcp :Git cherry-pick -n

" commits

map <leader>gc :Gcommit --verbose<CR>
map <leader>gca :Gcommit --verbose --all<CR>
map <leader>gcnv :Gcommit --no-verify<CR>
map <leader>gcF :Gcommit --amend<CR>

" github

map <leader>gp :Gpush<CR>
map <leader>gpf :Gpush --force<CR>
map <leader>gfr :Gpull --rebase<CR>
map <leader>gfm :Gfetch origin master:master<CR>
map <leader>grom :Git rebase origin/master<CR>

map <leader>gpr :terminal hub pull-request --browse<CR>
map <leader>gcm :Dispatch! hub compare<CR>
map <leader>gbr :Dispatch! hub browse<CR>

" gitgutter

let g:gitgutter_map_keys = 0

map [g :w<CR><Plug>GitGutterPrevHunk
map ]g :w<CR><Plug>GitGutterNextHunk
map [G :w<CR>G<Plug>GitGutterPrevHunk
map ]G :w<CR>gg<Plug>GitGutterNextHunk

map <Leader>ga <Plug>GitGutterStageHunk
map <Leader>gco <Plug>GitGutterUndoHunk

" merginal

autocmd BufFilePost Merginal:* setlocal relativenumber " buffers #s V
autocmd BufFilePost Merginal:* setlocal number

map <leader>gm :MerginalToggle<CR>

" ============================================================================
" make_it_look_pretty
" ============================================================================

set nowrap " no wrapping
set number " automatically turn line numbers on
set relativenumber " relative numbers

if has('mac')
  colorscheme gruvbox
  set termguicolors
endif

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

let g:startify_change_to_dir = 0

" airplane

set laststatus=2 " start up airplane
let g:airline_powerline_fonts = 1 " use fonts
let g:airline#extensions#tabline#enabled = 1 " airplane buffer tabs
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_c = ''
let g:airline_section_x = airline#section#create_right(['tagbar'])
let g:airline_section_y = airline#section#create_right(['filetype'])

" ============================================================================
" language_stuff
" ============================================================================

" linting

autocmd! BufWritePost * Neomake
au BufWritePost,BufEnter Neomake

map ]s :lnext<CR>
map [s :lprevious<CR>
map ]S :lfirst<CR>
map [S :llast<CR>

let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']

nmap <leader>l :w<CR>:Dispatch yarn run lint<CR>



" html

runtime macros/matchit.vim " setup extended matching with %, eg html
let g:closetag_filenames = "*.html,*.erb,*.jsx" " closetags for html, jsx and erb

" javascript

let g:vim_json_syntax_conceal = 0 " stop auto concealing for json in vim
let g:javascript_plugin_jsdoc = 1 " js syntax highlighting for plugin

" rails

map <leader>db :Dispatch! bundle<CR>
map <leader>dror :Rake one_ring<CR>
map <leader>drmt :Rake db:migrate RAILS_ENV=test<CR>
map <leader>drm :Rake db:migrate<CR>
map <leader>drmr :Rake db:migrate:reset<CR>
map <leader>drr :Rake routes<CR>
map <leader>drtp :Rake db:test:prepare<CR>
map <leader>da :Dispatch bundle exec annotate -rp after<CR>
map <leader>dgm :Rgenerate migration<space>
map <leader>bi ibinding.pry<esc>:w<CR>
map <leader>bo obinding.pry<esc>:w<CR>

" ============================================================================
" testing
" ============================================================================

" javascript

nmap <leader>tm :w<CR>:Dispatch npm run mocha<CR>

" ruby testing with zeus

nmap <leader>z :w<CR>:call RunNearestSpec()<CR>
nmap <leader>zz :w<CR>:execute("Start zeus rspec --format documentation" . expand("%p") . ":" . line(".")) <CR>
nmap <leader>zs :w<CR>:execute ':Dispatch JS_DRIVER=selenium bundle exec rspec --format documentation %:' . line('.')<CR>
nmap <leader>zl :w<CR>:call RunLastSpec()<CR>

nmap <leader>Z :w<CR>:call RunCurrentSpecFile()<CR>
nmap <leader>ZZ :w<CR>:Start zeus rspec %<CR>
nmap <leader>Zs :w<CR>:Dispatch JS_DRIVER=selenium bundle exec rspec %<CR>

let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

" ruby testing sans zeus

nmap <leader>t :w<CR>:execute("Dispatch bundle exec rspec --format documentation " . expand("%p") . ":" . line(".")) <CR>
nmap <leader>tt :w<CR>:execute("Start bundle exec rspec --format documentation " . expand("%p") . ":" . line(".")) <CR>
nmap <leader>ts :w<CR>:execute ':Dispatch JS_DRIVER=selenium bundle exec rspec --format documentation %:' . line('.')<CR>

nmap <leader>T :w<CR>:Dispatch bundle exec rspec --format documentation %<CR>
nmap <leader>TT :w<CR>:Start bundle exec rspec --format documentation %<CR>
nmap <leader>Ts :w<CR>:Dispatch JS_DRIVER=selenium bundle exec rspec --format documentation %<CR>

" circle ci

map <leader>tci :!circle open<CR>

let g:circle_update_frequencey_in_seconds = 3
let g:circle_last_update = 0
let g:circle_last_status = ""

function! SetCircleStatus(job_id, data, event) abort
  if a:event == 'stdout'
    let g:circle_last_status = join(a:data)
  elseif a:event == 'stderr'
    let g:circle_last_status = 'No internet'
  else
    let g:circle_last_status = 'ERROR'
  endif
  let g:circle_last_update = localtime()
endfunction

function! UpdateCircleStatus() abort
  let current_time = localtime()
  if current_time - g:circle_last_update > g:circle_update_frequencey_in_seconds
    let g:circle_last_update = current_time
    call jobstart('hub ci-status', {"on_stdout": function('SetCircleStatus'), "on_stderr": function('SetCircleStatus')})
  endif
  return g:circle_last_status
endfunction

let g:airline_section_c = "%{UpdateCircleStatus()}"
