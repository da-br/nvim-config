return {
    {
    'stevearc/oil.nvim',
     config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set("n", "<leader>fe", "<CMD>Oil<CR>", {desc = "Open file explorer"})
  end}
}
