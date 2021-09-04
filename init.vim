call plug#begin()

set number

" LSP Server
Plug 'neovim/nvim-lspconfig'
"
" Autocompletion
Plug 'hrsh7th/nvim-compe'

call plug#end()

lua << EOF
local nvim_lsp = require('lspconfig')['rust_analyzer'].setup {}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}
EOF
