-- Setup nvim-cmp.
local cmp = require"cmp"

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "vsnip" },
    }, {
        { name = "buffer" },
    }),
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig")["gopls"].setup {
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer=0})
        vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<cr>", {buffer=0})
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
        vim.keymap.set("n", "<leader>i", vim.lsp.buf.signature_help, {buffer=0})
        vim.keymap.set("n", "dn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "dp", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    end
}

require("lspconfig").sumneko_lua.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- Setup treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = { "bash", "dockerfile", "go", "gomod", "json", "lua", "vim", "yaml" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}

