function Crd()
    -- SAVE THE FILE LMAO
    vim.cmd("w")
    -- COMPILATION
    local file_extension = vim.fn.expand("%:e")
    if file_extension == "cpp" then
        local file_name = vim.fn.expand("%:p")
        local executable_name = vim.fn.expand("%:p:r")
        local compilecommand = "g++ -Wall -O2 -g '" .. file_name .. "' -o '" .. executable_name .. ".out'"
        vim.fn.system(compilecommand)
        if vim.v.shell_error == 0 then
            executable_name = executable_name .. ".out"

            -- runs the exec in a floating kitty terminal
            vim.fn.system("kitty -T nvimexec sh -c \"'" .. executable_name .. "';read -p 'Press Enter to exit ...'\"")

            --vim.fn.system("tmux split-window; sleep 1; tmux send-keys -t :.1 " .. executable_name .. " C-m")

            vim.fn.system('rm -f "' .. executable_name .. '"')
        else
            print(vim.v.shell_error)
        end
    elseif file_extension == "c" then
        local file_name = vim.fn.expand("%:p")
        local executable_name = vim.fn.expand("%:p:r")
        local compilecommand = "gcc -Wall -O2 -g '" .. file_name .. "' -o '" .. executable_name .. ".out'"
        vim.fn.system(compilecommand)
        if vim.v.shell_error == 0 then
            executable_name = executable_name .. ".out"
            -- vim.fn.system("kitty sh -c \"'" .. executable_name .. "';read -p 'Press Enter to exit ...'\"")
            vim.fn.system("kitty -T nvimexec sh -c \"'" .. executable_name .. "';read -p 'Press Enter to exit ...'\"")
            vim.fn.system('rm -f "' .. executable_name .. '"')
        else
            print(vim.v.shell_error)
        end
    elseif file_extension == "py" then
        local file_name = vim.fn.expand("%:p")
        -- vim.fn.system("kitty -T nvimexec sh -c \'python3 \"".. file_name .."\"; read -p \"Press Enter\" \' ")
        vim.fn.system("kitty -T nvimexec sh -c 'python3 \"" .. file_name .. '"; read -p "Press Enter" \' ')
    elseif file_extension == "go" then
        local file_name = vim.fn.expand("%:p")
        local executable_name = vim.fn.expand("%:p:r")
        local compilecommand = "go build " .. file_name
        vim.fn.system(compilecommand)
        if vim.v.shell_error == 0 then
            vim.fn.system("kitty -T nvimexec sh -c \"'" .. executable_name .. "';read -p 'Press Enter to exit ...'\"")
            vim.fn.system('rm -f "' .. executable_name .. '"')
        else
            print(vim.v.shell_error)
        end
    end
end

vim.keymap.set("n", "<leader>r", ":lua Crd()<CR>", {})
