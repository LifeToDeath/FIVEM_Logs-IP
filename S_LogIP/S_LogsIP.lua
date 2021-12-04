local logs = "https://ptb.discord.com/api/webhooks/916480812805914635/xCXyRMpwCj-ltkiW3XN17mKUf2s6j_JHCCTP-6--RLw7Moy6yfkmJKdM6C49Gbqlmp1q"
local communityname = "LifeToDeath - LOG IP"
local communtiylogo = "https://media.discordapp.net/attachments/915016540104060928/915248159905681428/LTD-LogoDiscord.png" --Must end with .png or .jpg

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "65280",
            ["title"] = "Joueur Connecter",
            ["description"] = "Pseudo : **"..name.."**\nIP : **"..ip.."**\n License : **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "LifeToDeath - LOG IP", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "16711680",
            ["title"] = "Joueur Deconnecter",
            ["description"] = "Pseudo : **"..name.."** \nRaison : **"..reason.."**\nIP : **"..ip.."**\n License : **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "LifeToDeath - LOG IP", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
