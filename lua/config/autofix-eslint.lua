local M = {}

-- 切换保存时自动EsLintFix
function M.enable_eslint_on_save()
  local group = vim.api.nvim_create_augroup("eslint_on_save", { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      local eslint_ok = vim.lsp.get_clients({ bufnr = buf, name = "eslint" })
      if eslint_ok then
        vim.cmd("EslintFixAll")
      end
    end,
    group = group,
  })
end

function M.disable_eslint_on_save()
  vim.api.nvim_del_augroup_by_name("eslint_on_save")
end

function M.toggle_eslint_on_save()
  if vim.fn.exists("#eslint_on_save#BufWritePre") == 0 then
    M.enable_eslint_on_save()
  else
    M.disable_eslint_on_save()
  end
end

return M
