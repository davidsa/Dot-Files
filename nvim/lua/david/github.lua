local git_url_cmd =
"git config --get remote.origin.url | awk -F \":\" '{print \"https://github.com/\"$2}' | sed 's/\\.git//'"

local git_branch_cmd = "git branch | awk '{print $2}'"

local trim = function(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local run_cmd = function(cmd)
  local handle = io.popen(cmd)
  if handle == nil then return end
  local result = handle:read("*a")
  handle:close()
  return trim(result)
end

local open_url = function(url)
  local handle = io.popen("open " .. url)

  if handle ~= nil then
    handle:close()
  end
end

local get_line_number = function()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  return r
end

local open_github_file = function()
  local remote = run_cmd(git_url_cmd)
  local branch = run_cmd(git_branch_cmd)
  local line_number = get_line_number()

  local file_path = vim.fn.expand("%")
  local url = remote .. "/blob/" .. branch .. "/" .. file_path .. "#L" .. line_number


  open_url(url)
end


local open_github_pr = function()
  vim.fn.search("#")
  local pr_number = vim.fn.expand("<cword>")

  local remote = run_cmd(git_url_cmd)

  local url = remote .. "/pull/" .. pr_number

  open_url(url)
end

vim.api.nvim_create_user_command('OpenGithubFile', open_github_file, {})

vim.api.nvim_create_user_command('OpenGithubPR', open_github_pr, {})
