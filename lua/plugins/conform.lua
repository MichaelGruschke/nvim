return {
    'stevearc/conform.nvim',
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "isort", "black" },
            },
            formas_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end
}
