local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")


local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
--        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
 --       view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

local tree = require('nvim-tree')

local config = {
    view = {
        mappings = {
            custom_only = true,
            list = {
                { key = "o", action = "edit", action_cb = edit_or_open },
                { key = "O", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "c", action = "close_node" },
                { key = "C", action = "collapse_all", action_cb = collapse_all },
--                { key = "T", action = "open_tab_silent", action_cb = open_tab_silent },
                { key = "<C-n>", action = "create" },
                { key = "<C-d>", action = "remove" },
                { key = "<C-r>", action = "rename" },
                { key = "<C-x>", action = "create" },
                { key = "<C-c>", action = "copy"   },
                { key = "<C-v>", action = "paste"  },
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = false
        }
    }
}

vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeFocus<cr>" ,{silent = true, noremap = true})
tree.setup(config)
