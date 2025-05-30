local QBCore = exports['qb-core']:GetCoreObject()

-- List of Kick usernames to track
local kickUsernames = {
    "StreamerOne",
    "StreamerTwo",
    "AnotherStreamer"
}

-- Track which streamers are currently live
local liveStatus = {}

-- Function to check if a specific user is live (with optional announcement)
local function CheckIfLive(username, announce)
    PerformHttpRequest("https://kick.com/api/v1/channels/" .. username, function(statusCode, response, headers)
        if statusCode == 200 then
            local data = json.decode(response)
            local currentlyLive = data and data.livestream and data.livestream.is_live

            if currentlyLive and not liveStatus[username] then
                liveStatus[username] = true
                if announce then
                    TriggerClientEvent("chat:addMessage", -1, {
                        color = { 0, 255, 0 },
                        multiline = true,
                        args = { "Kick", username .. " is now LIVE on Kick! 🎥 https://kick.com/" .. username }
                    })
                end
                print("[Kick Live Check] " .. username .. " is now live.")
            elseif not currentlyLive then
                liveStatus[username] = false
            end
        else
            print("[Kick Live Check] Failed to fetch data for " .. username .. ": " .. statusCode)
        end
    end, "GET", "", { ["Content-Type"] = "application/json" })
end

-- Loop to check all streamers every 60 seconds
CreateThread(function()
    while true do
        for _, username in ipairs(kickUsernames) do
            CheckIfLive(username, true)
            Wait(1000)
        end
        Wait(60000)
    end
end)

-- Manual command to check live status
QBCore.Commands.Add("kicklive", "Check if tracked streamers are live on Kick", {}, false, function(source, args)
    local src = source
    for _, username in ipairs(kickUsernames) do
        CheckIfLive(username, src == 0)
    end
    if src ~= 0 then
        TriggerClientEvent("chat:addMessage", src, {
            color = { 100, 200, 255 },
            multiline = true,
            args = { "Kick", "Checking Kick live status for tracked streamers..." }
        })
    end
end)
