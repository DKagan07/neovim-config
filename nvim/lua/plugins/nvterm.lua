return {
    "NvChad/nvterm",
    config = function()
        require("nvterm").setup()

        local nvterm = require("nvterm.terminal")
        vim.keymap.set("n", "<leader>v", function() nvterm.new "vertical" end)
        vim.keymap.set("n", "<leader>h", function() nvterm.new "horizontal" end)
        vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))
    end
}
