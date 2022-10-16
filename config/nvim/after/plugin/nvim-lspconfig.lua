local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>d", "<Cmd>Telescope diagnostics<cr>", opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, bufopts)
    -- Prefer Telescope versions
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<cr>", bufopts)
    vim.keymap.set("n", "gD", "<Cmd>Telescope lsp_type_definitions<cr>", bufopts)
    vim.keymap.set("n", "gi", "<Cmd>Telescope lsp_implementations<cr>", bufopts)
    vim.keymap.set("n", "gr", "<Cmd>Telescope lsp_references<cr>", bufopts)
    vim.keymap.set("n", "gs", "<Cmd>Telescope lsp_dynamic_workspace_symbols<cr>", bufopts)
    vim.keymap.set("n", "gS", "<Cmd>Telescope lsp_document_symbols<cr>", bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
        })
    end,
}

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
        })
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig.marksman.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gs", "<Cmd>Telescope lsp_document_symbols<cr>", bufopts)
    end,
}
