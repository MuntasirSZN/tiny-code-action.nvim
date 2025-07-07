local M = {}

M.VALID_PICKERS = {
  telescope = true,
  snacks = true,
  select = true,
  buffer = true,
}

M.VALID_BACKENDS = {
  vim = true,
  delta = true,
  difftastic = true,
  diffsofancy = true,
}

M.picker_config = {
  telescope = {
    layout_strategy = "vertical",
    layout_config = {
      width = 0.7,
      height = 0.9,
      preview_cutoff = 1,
      preview_height = function(_, _, max_lines)
        local h = math.floor(max_lines * 0.5)
        return math.max(h, 10)
      end,
    },
  },
  snacks = {
    layout = "vertical",
  },
  select = {},
  buffer = {
    hotkeys = false,
    hotkeys_mode = "text_diff_based",
    auto_preview = false,
    auto_accept = false,
    position = "cursor",
    winborder = nil,
    conceallevel = 1,
    keymaps = {
      preview = "K",
      close = "q",
    },
  },
}

M.default_config = {
  backend = "vim",
  picker = "telescope",
  backend_opts = {
    delta = {
      header_lines_to_remove = 4,
      args = {
        "--line-numbers",
      },
    },
    difftastic = {
      header_lines_to_remove = 1,
      args = {
        "--color=always",
        "--display=inline",
        "--syntax-highlight=on",
      },
    },
    diffsofancy = {
      header_lines_to_remove = 4,
    },
  },
  signs = {
    quickfix = { "", { link = "DiagnosticWarning" } },
    others = { "", { link = "DiagnosticWarning" } },
    refactor = { "", { link = "DiagnosticInfo" } },
    ["refactor.move"] = { "󰪹", { link = "DiagnosticInfo" } },
    ["refactor.extract"] = { "", { link = "DiagnosticError" } },
    ["source.organizeImports"] = { "", { link = "DiagnosticWarning" } },
    ["source.fixAll"] = { "󰃢", { link = "DiagnosticError" } },
    ["source"] = { "", { link = "DiagnosticError" } },
    ["rename"] = { "󰑕", { link = "DiagnosticWarning" } },
    ["codeAction"] = { "", { link = "DiagnosticWarning" } },
  },
}

return M
