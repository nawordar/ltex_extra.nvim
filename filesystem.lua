local M = {}

-- PRIVATE FUNCTIONS

M.file_exists = function (filename)
    local file = io.open(filename, "r")
    if file ~= nil then io.close(file) return true else return false end
end

-- PUBLIC FUNCTIONS

M.writeFile = function (type, lang, lines)
    local filename = table.concat({ "ltex", type, lang, "txt" }, ".")
    local file = io.open(filename, "a+")
    io.output(file)
    for _, line in ipairs(lines) do
        io.write(line .. "\n")
    end
    io.close(file)
end

M.readFile = function (type, lang)
    local filename = table.concat({ "ltex", type, lang, "txt" }, ".")
    if M.file_exists(filename) then
        local lines = {}
        local file = io.open(filename, "r")
        io.input(file)
        for line in io.lines(filename) do
            lines[#lines + 1] = line
        end
        io.close(file)
        return lines
    else
        return {}
    end
end

return M