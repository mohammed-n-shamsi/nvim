require("dapui").setup()

-- Configure dapui to toggle when dap is initialized or terminated
local dap, dapui = require("dap"), require("dapui")

-- Toggle dapui on open
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- Toggle dapui on completion
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
-- Toggle dapui on exit
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Specific DAPs

-- Rust
dap.adapters.lldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "/home/dom/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
        -- On windows you may have to uncomment this:
        -- detached = false,
    },
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
