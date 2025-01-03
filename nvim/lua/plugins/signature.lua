return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        hint_enable = false,
        hint_prefix = " ",
        toggle_key = "<c-s>",
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end,
}
