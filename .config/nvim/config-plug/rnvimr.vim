" paru -S ranger python-pynvim ueberzug
let g:rnvimr_ex_enable = 1
let g:rnvimr_draw_border = 0
let g:rnvimr_shadow_winblend = 70
let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'

nmap <Leader>r :RnvimrToggle<CR>