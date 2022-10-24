local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = true,
      -- list of mappings to set on the tree manually
      list = {
        { key = {'<CR>', 'l', 'o'}, cb = tree_cb('edit') },
        { key = 'i', cb = tree_cb('split')},
        { key = 's', cb = tree_cb('vsplit')},
        { key = 'r', cb = tree_cb('refresh')},
        { key = 'yy', cb = tree_cb('copy_name')},
        { key = 'gy', cb = tree_cb('copy_path') },
        { key = 'gY', cb = tree_cb('copy_absolute_path') },
        { key = '^', cb = tree_cb('dir_up') },
        { key = '?', cb = tree_cb('toggle_help')},
        { key = 't', cb = tree_cb('tabnew') },
        { key = '<F2>', cb = tree_cb('rename') },
        { key = '<C-x>', cb = tree_cb('cut') },
        { key = '<C-c>', cb = tree_cb('copy')},
        { key = '<C-v>', cb = tree_cb('paste') },
        { key = 'C', cb = tree_cb('create') },
        { key = 'D', cb = tree_cb('remove') },
        { key = '<C-d>', cb = tree_cb("cd") },
      }
    }
  },
}
