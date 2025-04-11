{ ... }:
{
  /*
    imports = map
    (name:
      this + "/${name}"
    )
    (lib.attrNames
      (filterAttrs
        (_: type: type == "dictionary") (readDir this)
      )
    );
  */

  imports = [ 
   #CODING
  #  ./mini.pairs
  #  ./ts-comments
    #./mini.ai
  #  ./lazydev 
   #COLORSCHEME
    ./themes #catppuccin
   #EDITOR
#    ./flash
#    ./whichkey #learning tool
#    ./gitsigns
#    ./trouble
#    ./todo-commentsds
   #FORMATTING
#    ./mason #clan https://www.youtube.com/watch?v=lsFoZIg-oDs
 #   ./conform 
   #LINTING
#    ./nvimlint
   #LSP
#    ./mason-lspconfig
#    ./lspconfig
     ./lsp
   #SYNTHAX
    ./colorizer #highlights hue
    ./treesitter #better synthax higlightning
#    ./nvim-treesitter-textobjects
#    ./nvim-ts-autotag
   #UI 
    ./bufferline
    ./lualine #adds a line showing stats
#    ./noice
#    ./mini.icons
#    ./nui.nvim
#    ./mini
#    ./snacks.nvim
#   ./cmp
   #UTIL
    ./telescope #find files, live grep, old files
#    ./dirbuf # ou oil
#    ./substitute
#    ./minivim
#    ./comment
#    ./persistence
#    ./plenary
 #   ./Linters
#    ./nvim-dap
#    ./fzf
 #   ./portals
#    ./leap
#    ./diagnostics
#    ./lazygit   

  ];
}
# https://www.youtube.com/watch?v=N93cTbtLCIM
