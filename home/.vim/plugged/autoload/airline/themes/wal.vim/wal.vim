" wal Airline
let g:airline#themes#wal#palette = {}

if !exists('g:wal_colors')
	let g:wal_colors = {}
endif

" Normal mode
let s:N  = [ get(g:wal_colors, 232, ''), get(g:wal_colors, 4, ''), 232, 4, 'BOLD' ]
let s:N2 = [ get(g:wal_colors, 4, ''), get(g:wal_colors, 1000, ''), 4, 337, 'BOLD' ]

" Insert mode
let s:I  = [ get(g:wal_colors, 232, ''), get(g:wal_colors, 2, ''), 232, 2, 'BOLD' ]
let s:I2 = [ get(g:wal_colors, 2, ''), get(g:wal_colors, 1000, ''), 2, 337, 'BOLD' ]

" Visual mode
let s:V  = [ get(g:wal_colors, 232, ''), get(g:wal_colors, 1, ''), 232, 1, 'BOLD' ]
let s:V2 = [ get(g:wal_colors, 1, ''), get(g:wal_colors, 1000, ''), 1, 337, 'BOLD' ]

" Replace mode
let s:R  = [ get(g:wal_colors, 232, ''), get(g:wal_colors, 5, ''), 232, 5, 'BOLD' ]
let s:R2 = [ get(g:wal_colors, 5, ''), get(g:wal_colors, 1000, ''), 5, 337, 'BOLD' ]

let g:airline#themes#wal#palette.normal  = airline#themes#generate_color_map(s:N, s:N2, s:N2)
let g:airline#themes#wal#palette.insert  = airline#themes#generate_color_map(s:I, s:I2, s:I2)
let g:airline#themes#wal#palette.visual  = airline#themes#generate_color_map(s:V, s:V2, s:V2)
let g:airline#themes#wal#palette.replace = airline#themes#generate_color_map(s:R, s:R2, s:R2)

let g:airline#themes#wal#palette.accents = { 'red': [ get(g:wal_colors, 1000, ''), get(g:wal_colors, 2, ''), 337, 2, 'BOLD' ] }

" Inactive mode
let s:IN1 = [ '', '', 1000, 8 ]
let s:IN2 = [ '', '', 1000, 337 ]

let s:IA = [ s:IN1[1], s:IN2[1], s:IN1[3], s:IN2[3], '' ]
let g:airline#themes#wal#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Warnings
let s:WI = [ get(g:wal_colors, 232, ''), get(g:wal_colors, 1, ''), 232, 1, 'BOLD' ]
let g:airline#themes#wal#palette.normal.airline_warning  = s:WI
let g:airline#themes#wal#palette.insert.airline_warning  = s:WI
let g:airline#themes#wal#palette.visual.airline_warning  = s:WI
let g:airline#themes#wal#palette.replace.airline_warning = s:WI

let g:airline#themes#wal#palette.normal.airline_error  = s:WI
let g:airline#themes#wal#palette.insert.airline_error  = s:WI
let g:airline#themes#wal#palette.visual.airline_error  = s:WI
let g:airline#themes#wal#palette.replace.airline_error = s:WI

" Tabline
let g:airline#themes#wal#palette.tabline = {
      \ 'airline_tab':     [ get(g:wal_colors, 4, ''), get(g:wal_colors, 1000, ''), 4, 337, 'BOLD' ],
      \ 'airline_tabsel':  [ get(g:wal_colors, 232, ''), get(g:wal_colors, 4, ''), 232, 4, 'BOLD' ],
      \ 'airline_tabtype': [ get(g:wal_colors, 232, ''), get(g:wal_colors, 4, ''), 232, 4, 'BOLD' ],
      \ 'airline_tabfill': [ get(g:wal_colors, 4, ''), get(g:wal_colors, 1000, ''), 4, 337, 'BOLD' ],
      \ 'airline_tabmod':  [ get(g:wal_colors, 232, ''), get(g:wal_colors, 4, ''), 232, 4, 'BOLD' ]
\ }

if !get(g:, 'loaded_ctrlp', 'NONE')
  finish
endif

let g:airline#themes#wal#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ get(g:wal_colors, 1000, ''), get(g:wal_colors, 337, ''), 337, 337, 'BOLD' ],
      \ [ get(g:wal_colors, 1000, ''), get(g:wal_colors, 337, ''), 337, 337, 'BOLD' ],
      \ [ get(g:wal_colors, 1000, ''), get(g:wal_colors, 337, ''), 337, 337, 'BOLD' ] )
