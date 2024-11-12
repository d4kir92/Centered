local _, Centered = ...
-- By D4KiR
if D4CENTAB == nil then
	D4CENTAB = {}
end

function Centered:InitSettings()
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
	settings_playergap.min = -480
	settings_playergap.max = 50
	settings_playergap.steps = 1
	settings_playergap.func = Centered.Update
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
	settings_playerheight.steps = 1
	settings_playerheight.func = Centered.Update
	settings_playerheight.dbvalue = "playerheight"
	D4CENTABCreateSlider(settings_playerheight)
	Y = Y - H
	Y = Y - BR
	local settings_header2 = {}
	settings_header2.frame = D4CENTAB_Settings.panel
	settings_header2.parent = D4CENTAB_Settings.panel
	settings_header2.x = 10
	settings_header2.y = Y
	settings_header2.text = "OLD Wide Settings"
	settings_header2.textsize = 24
	D4CENTABCreateText(settings_header2)
	Y = Y - H
	Y = Y - BR
	local settings_playergap2 = {}
	settings_playergap2.name = "playergap"
	settings_playergap2.parent = D4CENTAB_Settings.panel
	settings_playergap2.value = D4CENGetConfig("playergap", -8)
	settings_playergap2.text = "playergap"
	settings_playergap2.x = 10
	settings_playergap2.y = Y
	settings_playergap2.min = -2280
	settings_playergap2.max = 1850
	settings_playergap2.steps = 1
	settings_playergap2.func = Centered.Update
	settings_playergap2.dbvalue = "playergap"
	D4CENTABCreateSlider(settings_playergap2)
	if InterfaceOptions_AddCategory then
		InterfaceOptions_AddCategory(D4CENTAB_Settings.panel)
	else
		local category, _ = _G.Settings.RegisterCanvasLayoutCategory(D4CENTAB_Settings.panel, "Centered")
		_G.Settings.RegisterAddOnCategory(category)
	end
end

local loaded = false
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

	if vars and addo and not loaded then
		loaded = true
		SetCVar("ScriptErrors", 1)
		Centered:InitSettings()
		Centered:Setup()
	end
end

frame:SetScript("OnEvent", frame.OnEvent)
