-- By D4KiR

CENBUILD = "CLASSIC"
if select(4, GetBuildInfo()) >= 100000 then
	CENBUILD = "RETAIL"
elseif select(4, GetBuildInfo()) > 29999 then
	CENBUILD = "WRATH"
elseif select(4, GetBuildInfo()) > 19999 then
	CENBUILD = "TBC"
end

if D4CENTAB == nil then
	D4CENTAB = {}
end

local function InitSettings()
	D4CENTAB_Settings = {}
	local settingname = D4CENTAB.name
	D4CENTAB_Settings.panel = CreateFrame("Frame", settingname, UIParent)
	D4CENTAB_Settings.panel.name = settingname

	local Y = -14
	local H = 16
	local BR = 30

	local settings_header = {}
	settings_header.frame = D4CENTAB_Settings.panel
	settings_header.parent = D4CENTAB_Settings.panel
	settings_header.x = 10
	settings_header.y = Y
	settings_header.text = settingname
	settings_header.textsize = 24
	D4CENTABCreateText(settings_header)
	Y = Y - BR

	Y = Y - BR
	local settings_playergap = {}
	settings_playergap.name = "playergap"
	settings_playergap.parent = D4CENTAB_Settings.panel
	settings_playergap.value = D4CENGetConfig("playergap", -8)
	settings_playergap.text = "playergap"
	settings_playergap.x = 10
	settings_playergap.y = Y
	settings_playergap.min = -2280
	settings_playergap.max = 1850
	settings_playergap.steps = 8
	settings_playergap.func = SetupD4CEN
	settings_playergap.dbvalue = "playergap"
	D4CENTABCreateSlider(settings_playergap)
	Y = Y - H

	Y = Y - BR
	local settings_playerheight = {}
	settings_playerheight.name = "playerheight"
	settings_playerheight.parent = D4CENTAB_Settings.panel
	settings_playerheight.value = D4CENGetConfig("playerheight", 278)
	settings_playerheight.text = "playerheight"
	settings_playerheight.x = 10
	settings_playerheight.y = Y
	settings_playerheight.min = -450
	settings_playerheight.max = 440
	settings_playerheight.steps = 2
	settings_playerheight.func = SetupD4CEN
	settings_playerheight.dbvalue = "playerheight"
	D4CENTABCreateSlider(settings_playerheight)
	Y = Y - H

	InterfaceOptions_AddCategory(D4CENTAB_Settings.panel)
end

D4CENTABloaded = false

local vars = false
local addo = false
local frame = CreateFrame("FRAME")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
function frame:OnEvent(event)
	if event == "VARIABLES_LOADED" then
		vars = true
	end
	if event == "ADDON_LOADED" then
		addo = true
	end
	if vars and addo and not D4CENTABloaded then
		D4CENTABloaded = true
		SetCVar( "ScriptErrors", 1 )
		InitSettings()
	end
end
frame:SetScript("OnEvent", frame.OnEvent)