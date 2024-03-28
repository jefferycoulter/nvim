local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>DapStepOver<cr>")
vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<cr>")

-- launch dap ui when debugging
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

-- c/c++ debugger
dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = vim.fn.exepath('codelldb'),
        args = {"--port", "${port}"},
    }
}
-- c/c++ config
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}
dap.configurations.c = dap.configurations.cpp

-- python debugger
-- python config
