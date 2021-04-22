local function OnPlayerConnecting(plname, setKickReason, deferrals)
	local fileName = './logins/' .. plname .. '.json'
	local logins = exports.libCommons:loadJson(fileName)
	if logins == nil then
		logins = {}
	end
    local player = source
    local identifiers = GetPlayerIdentifiers(player)
	logins = {name = plname, lastLogin = os.date("%c", os.time()), ids = identifiers}
	exports.libCommons:saveJson(fileName, logins)
 end

AddEventHandler("playerConnecting", OnPlayerConnecting)