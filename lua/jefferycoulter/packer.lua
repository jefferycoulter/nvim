-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  --
  -- fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- 
  -- color scheme
  use ('rktjmp/lush.nvim')
  use ({
        '~/.config/nvim/lua/jefferycoulter/projects/purple',
        as = 'purple',
        config = function()
                vim.cmd('colorscheme purple')
            end
    })

  -- treesitter
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  

  use('mbbill/undotree')
  

  use('tpope/vim-fugitive')
  
  -- lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	  }
  }
  use('hrsh7th/nvim-cmp')
 
  -- prettier formatting
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  
  -- debugger
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
 
  -- file tree
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
  }
  use ('nvim-tree/nvim-web-devicons')
  
end)
