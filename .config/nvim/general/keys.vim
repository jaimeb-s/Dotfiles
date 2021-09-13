" Tecla lider <space>
let mapleader=" "

"------------ Personalizados ------------
" Archivor
" Guardar
nmap <Leader>s :w<CR>
" Guargar como ...
nmap <C-s> :w
" Salir
nmap <Leader>q :q<CR>

" Colocar ventana horizontal
nmap <C-g> :sp<CR>
" Colocar ventana verical
nmap <C-h> :vsp<CR>

" alt + hjkl cambiar el tamaño de las ventanas
nmap <M-j> :resize -2<CR>
nmap <M-k> :resize +2<CR>
nmap <M-h> :vertical resize -2<CR>
nmap <M-l> :vertical resize +2<CR>

" ------------ Buffet ------------
" Siguiente buffer
nmap <TAB> :bnext<CR>
" Anterior buffer
nmap <S-TAB> :bprevious<CR>
" Close current buffer
nnoremap <C-b> :bd<CR>
" Saltar a las pestañas(1-9)
nmap <M-1> :buffer 1<CR>
nmap <M-2> :buffer 2<CR>
nmap <M-3> :buffer 3<CR>
nmap <M-4> :buffer 4<CR>
nmap <M-5> :buffer 5<CR>
nmap <M-6> :buffer 6<CR>
nmap <M-7> :buffer 7<CR>
nmap <M-8> :buffer 8<CR>
nmap <M-9> :buffer 9<CR>
