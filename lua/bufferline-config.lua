local bufferline = require('bufferline')

bufferline.setup({
    options = {
        -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
        },
        },
        -- 使用 nvim 内置 LSP  后续课程会配置
        diagnostics = "nvim_lsp",
        -- 可选，显示 LSP 报错图标
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or "")
            s = s .. n .. sym
        end
        return s
        end,
    },
})

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete<CR>", opt)
map("n", "<C-j>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-k>", ":BufferLineCyclePrev<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
