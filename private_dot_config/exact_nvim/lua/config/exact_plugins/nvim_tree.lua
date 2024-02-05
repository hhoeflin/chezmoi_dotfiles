return {
    'nvim-tree/nvim-tree.lua',
    dependencies={'nvim-tree/nvim-web-devicons'},
    keys={
        {'<C-p>', ':NvimTreeToggle <CR>', noremap=true}
    },
    opts={
      update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
      },
      renderer= {
        root_folder_modifier = ":t"
      }
    },
}
