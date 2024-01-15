return {
    'mfussenegger/nvim-lint',
    dependencies = {
        "rshkarin/mason-nvim-lint",
        "williamboman/mason.nvim",
    },
    priority = 200,
    config = function()
        require('lint').linters_by_ft = {
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

        require("mason-nvim-lint").setup()

        vim.keymap.set("n", '<leader>l', function() require('lint').try_lint() end)
    end,
}
