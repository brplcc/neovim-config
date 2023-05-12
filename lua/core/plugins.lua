local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- My plugins here

	use 'hachy/eva01.vim'
	use 'ellisonleao/gruvbox.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'neoclide/coc.nvim'
	use 'easymotion/vim-easymotion'
	use 'andweeb/presence.nvim'
	use 'romgrk/barbar.nvim'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'axvr/photon.vim'
	use 'brplcc/evl01'
	use 'preservim/vim-colors-pencil'
	use 'axvr/raider.vim'
	use 'tpope/vim-surround'
	use 'm4xshen/autoclose.nvim'
	use 'andreypopp/vim-colors-plain'
	use 'nvim-lualine/lualine.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
