return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
          detached = vim.fn.has("win32") == 0,
        }
      }
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug current file",
          request = "launch",
          program = "${file}",
        },
        {
          type = "delve",
          name = "Current package",
          request = "launch",
          program = "${workspaceFolder}",
        },
      }
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })
      for name, sign in pairs(Icons.dap) do
        sign = type(sign) == 'table' and sign or { sign } ---@cast sign string
        vim.fn.sign_define(name,
          { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] })
      end
    end,
    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = "dap: Set Conditional [B]reakpoint"
      },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "dap: Set [B]reakpoint" },
      { "<leader>dc", function() require("dap").continue() end,          desc = "dap: [C]ontinue/Run" },
      { "<leader>dg", function() require("dap").goto_() end,             desc = "dap: [G]o to Line (No Execute)" },
      { "<leader>do", function() require("dap").step_over() end,         desc = "dap: Step [O]ver" },
      { "<leader>di", function() require("dap").step_into() end,         desc = "dap: Step [I]nto" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,     desc = "dap: Run to [C]ursor" },
      { "<leader>dO", function() require("dap").step_out() end,          desc = "dap: Step [O]ut" },
      { "<leader>dj", function() require("dap").down() end,              desc = "dap: [D]own" },
      { "<leader>dk", function() require("dap").up() end,                desc = "dap: [U]p" },
      { "<leader>dl", function() require("dap").run_last() end,          desc = "dap: Run [L]ast" },
      { "<leader>dP", function() require("dap").pause() end,             desc = "dap: [P]ause" },
      { "<leader>dr", function() require("dap").repl.toggle() end,       desc = "dap: [T]oggle REPL" },
      { "<leader>ds", function() require("dap").session() end,           desc = "dap: [S]ession" },
      { "<leader>dt", function() require("dap").terminate() end,         desc = "dap: [T]erminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end,  desc = "dap: [W]idgets" },
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      "mfussenegger/nvim-dap",
      'nvim-neotest/nvim-nio'
    },
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "x" } },
    },
    opts = {},
    config = function(_, opts)
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup(opts)
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close {}
      end
    end,
  },
}
