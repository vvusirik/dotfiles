local plugins = {
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "mfussenegger/nvim-dap",
        keys = {
            { '<leader>db', '<cmd> DapToggleBreakpoint <cr>', desc = 'Toggle breakpoint' },
        },
        dependencies = {
            "nvim-neotest/nvim-nio",
        }
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        keys = {
            {
                '<leader>dpr',
                function()
                    require('dap-python').test_method()
                end,
                desc = 'Run Python Debugger'
            }

        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }
}
return plugins
