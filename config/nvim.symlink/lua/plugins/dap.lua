print("Loading DAP configurations")

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
      },
    },

    opts = function()
      local dap = require("dap")
      if not dap.adapters["pwa-node"] then
        require("dap").adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = {
              LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
              "${port}",
            },
          },
        }
      end
      if not dap.adapters["node"] then
        dap.adapters["node"] = function(cb, config)
          if config.type == "node" then
            config.type = "pwa-node"
          end
          local nativeAdapter = dap.adapters["pwa-node"]
          if type(nativeAdapter) == "function" then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
      local vscode = require("dap.ext.vscode")
      vscode.type_to_filetypes["node"] = js_filetypes
      vscode.type_to_filetypes["pwa-node"] = js_filetypes

      -- b5web debugging
      for _, language in ipairs(js_filetypes) do
        dap.configurations[language] = {
          {
            name = "b5web-launch",
            type = "firefox",
            request = "launch",
            url = "https://my.b5local.com:3000",
            webRoot = "${workspaceFolder}/client/web-ui",
            sourceMaps = true,
            skipFiles = { "node_modules/**" },
            runtimeArgs = { "--remote-debugging-port=9222" },
            profile = "debugging",
          },
          {
            name = "b5web-launch-hot",
            type = "firefox",
            request = "launch",
            url = "https://my.b5local.com:4000",
            webRoot = "${workspaceFolder}/client/web-ui",
            sourceMaps = true,
            skipFiles = { "node_modules/**" },
            runtimeArgs = { "--remote-debugging-port=9222" },
            profile = "debugging",
          },
        }
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end

      dapui.layout = {}
    end,
  },
}
