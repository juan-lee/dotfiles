local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, bufopts)
    vim.keymap.set("n", "gD", require('telescope.builtin').lsp_type_definitions, bufopts)
    vim.keymap.set("n", "gi", require('telescope.builtin').lsp_implementations, bufopts)
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, bufopts)
    vim.keymap.set("n", "gs", require('telescope.builtin').lsp_dynamic_workspace_symbols, bufopts)
    vim.keymap.set("n", "gS", require('telescope.builtin').lsp_document_symbols, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)

    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "<buffer>",
        callback = function() vim.lsp.buf.format({ async = false }) end,
    })
end

local servers = {
    gopls = {},
    marksman = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

require('fidget').setup()
