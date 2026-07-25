return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      file_ignore_patterns = { '.git/', 'vendor/' },
    },
    pickers = {
      find_files = { hidden = true },
      live_grep = {
        additional_args = function()
          return { '--hidden' }
        end,
      },
      grep_string = {
        additional_args = function()
          return { '--hidden' }
        end,
      },
      buffers = {
        sort_mru = true,
        mappings = {
          i = {
            ["<C-d>"] = function(bufnr)
              require("telescope.actions").delete_buffer(bufnr)
            end,
          },
          n = {
            ["dd"] = function(bufnr)
              require("telescope.actions").delete_buffer(bufnr)
            end
          },
        },
      }
    },
  },
  keys = {
    {
      '<leader>sf',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>ss',
      function()
        require('telescope.builtin').builtin()
      end,
      desc = '[S]earch [S]elect Telescope',
    },
    {
      '<leader>sw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = '[S]earch Current [W]ord',
    },
    {
      '<leader>sg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      function()
        require('telescope.builtin').resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>s.',
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = '[S]earch Recent Files ("." for repeat)',
    },
    {
      '<leader>sh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sk',
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sq',
      function()
        require('telescope.builtin').quickfix()
      end,
      desc = '[S]earch items in [Q]uickfix list',
    },
    {
      '<leader>sn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config', follow = true, hidden = true }
      end,
      desc = '[S]earch [N]eovim files',
    },
    {
      '<leader>sb',
      function()
        require('telescope.builtin').buffers {
          sort_mru = true,
          mappings = {
            i = { ["<C-d>"] = require("telescope.actions").delete_buffer },
            n = { ["dd"] = require("telescope.actions").delete_buffer },
          },
        }
      end,
      desc = '[S]earch Open [B]uffers',
    },
    {
      '<leader>s/',
      function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = '[Search] by Grep in Open Files',
    },
    {
      'gd',
      function()
        require('telescope.builtin').lsp_definitions()
      end,
      desc = '[G]o to [D]efinitions',
    },
    {
      'ga',
      function()
        require('telescope.builtin').lsp_references()
      end,
      desc = '[G]o to [A]ll References',
    },
    {
      'gi',
      function()
        require('telescope.builtin').lsp_implementations()
      end,
      desc = '[G]o to [I]mplementation',
    },
    {
      '<leader>gt',
      function()
        require('telescope.builtin').lsp_type_definitions()
      end,
      desc = '[G]o to [T]ype Definition',
    },
    {
      '<leader>sS',
      function()
        require('telescope.builtin').lsp_document_symbols()
      end,
      desc = 'Document [S]ymbols',
    },
    {
      '<leader>sW',
      function()
        require('telescope.builtin').lsp_dynamic_workspace_symbols()
      end,
      desc = '[W]orkspace Symbols',
    },
  },
}
