return {
    {
        "theprimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            -- Probably need to change these markers
            vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
            vim.keymap.set("n", "<leader>m", function() ui.toggle_quick_menu() end)

            vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>4;", function() ui.nav_file(4) end)
            vim.keymap.set("n", "<leader>5;", function() ui.nav_file(5) end)

            vim.keymap.set("n", "<leader>n", function() ui.nav_next() end)
            vim.keymap.set("n", "<leader>p", function() ui.nav_prev() end)
        end,
    },
}
