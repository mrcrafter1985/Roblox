local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local allowedPlayers = {"TRM_Diamond", "megalol933", "yaromir2010000"}

local function onChatted(player, message)
    if table.find(allowedPlayers, player.Name, 1, true) then
        local args = {
            [1] = "Order",
            [2] = ""
        }

        if string.lower(message) == "meat" then
	    args[2] = "Meat"
	elseif string.lower(message) == "veggies" then
            args[2] = "Veggies"
        elseif string.lower(message) == "bread" then
            args[2] = "Bread"
        elseif string.lower(message) == "cups" then
            args[2] = "Cups"
        elseif string.lower(message) == "trays" then
            args[2] = "Trays"
        elseif string.lower(message) == "fries" then
            args[2] = "Fries"
        end

        if args[2] ~= "" then
            ReplicatedStorage.Remotes.Tell:FireServer(unpack(args))
        end
    end
end

local function bindChatted(player)
    player.Chatted:Connect(function(message)
        onChatted(player, message)
    end)
end

Players.PlayerAdded:Connect(function(player)
    bindChatted(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
    bindChatted(player)
end
