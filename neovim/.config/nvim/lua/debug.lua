local p = {}

p.msg = function(msg)
    local job = require('plenary.job'):new({
        command = 'socat',
        args = {
            "UNIX-CONNECT:nvimtest.sock",
            "SYSTEM:echo " .. msg
        }
    })

    job:start() 
end

return p
