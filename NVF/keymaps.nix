{ ... }:
{

config.programs.nvf.settings.vim.keymaps = [
    # telescope colorscheme
    # { key = "<leader>fc"; action = ":Telescope colorscheme<cr>"; mode = ["n" "x"]; silent = true; desc = "Colorscheme [Telescope]"; }
    { key = "<C-p>"; action = ":Telescope find_files<cr>"; mode = ["n"]; silent = true; desc = "Colorscheme [Telescope]"; }
    #adicionar setas p/ porra nenhuma
    #adicionaro telescope CRTL SHIFT P
    
    # adcicionar crlt a { key = "<C-a>"; action = "gg<S-v>G"; mode = ["n"]; silent = true; desc = "Select All"; }
    # adicionar tab pra mexer
    # entender as keymaps e os combos do vim mermo
    # crtl F 
    { key = "<C-e>"; action = ":Neotree toggle right<CR>"; mode = ["n"]; silent = false; }
    { key = "<C-gs>"; action = ":Gitsigns toggle_signs<CR>"; mode = ["n"]; silent = false; }




    # yanky-nvim config
    # { key = "p";     action = "<Plug>(YankyPutAfter)";                    mode = ["n" "x"]; silent = true; }
    # { key = "P";     action = "<Plug>(YankyPutBefore)";                   mode = ["n" "x"]; silent = true; }
    # { key = "gp";    action = "<Plug>(YankyGPutAfter)";                   mode = ["n" "x"]; silent = true; }
    # { key = "gP";    action = "<Plug>(YankyGPutBefore)";                  mode = ["n" "x"]; silent = true; }
    # { key = "<c-p>"; action = "<Plug>(YankyPreviousEntry)";               mode = "n";       silent = true; }
    # { key = "<c-n>"; action = "<Plug>(YankyNextEntry)";                   mode = "n";       silent = true; }
    # { key = "]p";    action = "<Plug>(YankyPutIndentAfterLinewise)";      mode = "n";       silent = true; }
    # { key = "[p";    action = "<Plug>(YankyPutIndentBeforeLinewise)";     mode = "n";       silent = true; }
    # { key = "]P";    action = "<Plug>(YankyPutIndentAfterLinewise)";      mode = "n";       silent = true; }
    # { key = "[P";    action = "<Plug>(YankyPutIndentBeforeLinewise)";     mode = "n";       silent = true; }
    # { key = ">p";    action = "<Plug>(YankyPutIndentAfterShiftRight)";    mode = "n";       silent = true; }
    # { key = "<p";    action = "<Plug>(YankyPutIndentAfterShiftLeft)";     mode = "n";       silent = true; }
    # { key = ">P";    action = "<Plug>(YankyPutIndentBeforeShiftRight)";   mode = "n";       silent = true; }
    # { key = "<P";    action = "<Plug>(YankyPutIndentBeforeShiftLeft)";    mode = "n";       silent = true; }
    # { key = "=p";    action = "<Plug>(YankyPutAfterFilter)";              mode = "n";       silent = true; }
    # { key = "=P";    action = "<Plug>(YankyPutBeforeFilter)";             mode = "n";       silent = true; }
];
}