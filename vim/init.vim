""Make nvim use your vim config, add the following to ~/.config/nvim/init.vim

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

lua <<EOF
local dap = require('dap')
local dapui = require("dapui")

dapui.setup()

require('dap-go').setup {
  -- delve configurations
  delve = {
      -- time to wait for delve to initialize the debug session.
      -- default to 20 seconds
      initialize_timeout_sec = 20,
      -- a string that defines the port to start delve debugger.
      -- default to string "${port}" which instructs nvim-dap
      -- to start the process in a random available port
      port = "${port}"
  },
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
}

-- You can use nvim-dap events to open and close the windows automatically
-- from: https://github.com/rcarriga/nvim-dap-ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

EOF

