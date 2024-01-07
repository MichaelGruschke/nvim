return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            python = { 'ruff' },
            sh = { 'shellcheck' },
            yaml = { 'yamllint' },
            json = { 'jsonlint' },
            markdown = { 'markdownlint' },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", {clear=true})
        vim.api.nvim_create_autocmd({ "BufEnter","BufWritePost"}, {
            pattern = "*", group = lint_augroup, callback = function()
                require('lint').try_lint()
            end})
    end,
}
