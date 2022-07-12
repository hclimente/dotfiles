if vim.fn.isdirectory('./env/') then
    require("lspconfig").pyright.setup {
        settings = {
    	    python = {
      	        pythonPath = 'env/bin/python3'
	        }
        }
    }
else
    require("lspconfig").pyright.setup { }
end


