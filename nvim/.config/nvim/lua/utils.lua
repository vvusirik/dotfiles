local M = {}
function M.get_git_root()
    local handle = io.popen("git rev-parse --show-toplevel")
    local res = handle:read("*a")
    handle:close()
    res = string.gsub(res, "[\n\r]","")
    return {res}
end 

--TODO filter live grep results by .gitignore
return M
