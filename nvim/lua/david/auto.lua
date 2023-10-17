local group = vim.api.nvim_create_augroup("DotEnv", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = "*.env*", command = "set filetype=bash", group = group })
