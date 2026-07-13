local M = {}

local CONST = {
    LOG_PATH = "/storage/emulated/0/Android/data/com.tencent.ig/files/ZENKO/bypass.c",
    LOG_ENABLE_FILE = "/storage/emulated/0/Android/data/com.tencent.ig/files/ZENKO/true",
}

function M.WriteLog(text)
    local flag = io.open(CONST.LOG_ENABLE_FILE, "rb")
    if not flag then return end
    flag:close()

    pcall(function()
        local f = io.open(CONST.LOG_PATH, "a+")
        if f then
            f:write("[" .. os.date("%Y-%m-%d %H:%M:%S") .. "] [MOD] " .. tostring(text) .. "\n")
            f:close()
        end
    end)
end

function M.TesRun()
    M.WriteLog("[RunLuaFromURL] RunLuaFromURL WORK")
end

return M