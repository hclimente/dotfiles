-- null-ls
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.isort,
  },
})

-- use python from conda environment
if vim.fn.isdirectory('./env/') then
    require("lspconfig").pylsp.setup {
        settings = {
    	    python = {
      	        pythonPath = 'env/bin/python3'
	        }
        }
    }
else
    require("lspconfig").pyright.setup { }
end


