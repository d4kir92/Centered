-- By D4KiR
local _, Centered = ...
local censet = nil
local DEFAULT_WIDTH = 460
local DEFAULT_HEIGHT = 400
function Centered:ToggleSettings()
	if censet == nil then return end
	censet:Toggle()
end

local function GetCollapsed(key)
	if key == nil then return nil end
	if type(D4CEN) ~= "table" then return nil end
	if type(D4CEN["COLLAPSED"]) ~= "table" then return nil end

	return D4CEN["COLLAPSED"][key]
end

local function SetCollapsed(key, collapsed)
	if key == nil then return end
	if type(D4CEN) ~= "table" then return end
	if type(D4CEN["COLLAPSED"]) ~= "table" then D4CEN["COLLAPSED"] = {} end
	if collapsed then
		D4CEN["COLLAPSED"][key] = true
	else
		D4CEN["COLLAPSED"][key] = nil
	end
end

local function AddCategory(key, level)
	censet:AddCategory({
		["label"] = "LID_" .. key,
		["key"] = key,
		["search"] = key,
		["level"] = level
	})
end

local function AddCheckbox(key, dbkey, default, func)
	censet:AddCheckbox({
		["label"] = "LID_" .. key,
		["search"] = key,
		["value"] = Centered:GV(D4CEN, dbkey, default),
		["func"] = function(value)
			Centered:SV(D4CEN, dbkey, value)
			if func then func(value) end
		end
	})
end

local function AddSlider(key, dbkey, default, vmin, vmax, step, decimals, func)
	censet:AddSlider({
		["label"] = "LID_" .. key,
		["search"] = key,
		["value"] = D4CENGetConfig(dbkey, default),
		["min"] = vmin,
		["max"] = vmax,
		["step"] = step,
		["decimals"] = decimals,
		["func"] = function(value)
			Centered:SV(D4CEN, dbkey, value)
			if func then func(value) end
		end
	})
end

function Centered:InitSettings()
	D4CEN = D4CEN or {}
	Centered:SetVersion(132222, "1.1.40")
	Centered:AddSlash("cen", Centered.ToggleSettings)
	Centered:AddSlash("centered", Centered.ToggleSettings)
	censet = Centered:CreateUIWindow({
		["name"] = "CenteredSettings",
		["pTab"] = {"CENTER"},
		["width"] = Centered:GV(D4CEN, "WINDOWWIDTH", DEFAULT_WIDTH),
		["height"] = Centered:GV(D4CEN, "WINDOWHEIGHT", DEFAULT_HEIGHT),
		["minWidth"] = 360,
		["minHeight"] = 240,
		["onResize"] = function(width, height)
			Centered:SV(D4CEN, "WINDOWWIDTH", width)
			Centered:SV(D4CEN, "WINDOWHEIGHT", height)
		end,
		["getCollapsed"] = function(key) return GetCollapsed(key) end,
		["setCollapsed"] = function(key, collapsed) SetCollapsed(key, collapsed) end,
		["title"] = format("|T132222:16:16:0:0|t Centered v%s", Centered:GetVersion())
	})

	censet:SuspendLayout()
	censet:AddSearch()
	AddCategory("GENERAL")
	AddCheckbox("MMBTN", "MMBTN", Centered:GetWoWBuild() ~= "RETAIL", function(value)
		if value then
			Centered:ShowMMBtn("Centered")
		else
			Centered:HideMMBtn("Centered")
		end
	end)

	AddCategory("UNITFRAMES")
	AddSlider("PLAYERGAP", "playergap", -8, -480, 50, 1, 0, function() Centered:Update() end)
	AddSlider("PLAYERHEIGHT", "playerheight", 278, -450, 440, 1, 0, function() Centered:Update() end)
	AddCategory("WIDESCREEN")
	AddSlider("PLAYERGAPWIDE", "playergap", -8, -2280, 1850, 1, 0, function() Centered:Update() end)
	censet:ResumeLayout()
	Centered:CreateMinimapButton({
		["name"] = "Centered",
		["icon"] = 132222,
		["dbtab"] = D4CEN,
		["vTT"] = {{"|T132222:16:16:0:0|t Centered", "v" .. Centered:GetVersion()}, {Centered:Trans("LID_LEFTCLICK"), Centered:Trans("LID_OPENSETTINGS")}, {Centered:Trans("LID_SHIFTRIGHTCLICK"), Centered:Trans("LID_HIDEMINIMAPBUTTON")}},
		["funcL"] = function() Centered:ToggleSettings() end,
		["funcSR"] = function()
			Centered:SV(D4CEN, "MMBTN", false)
			Centered:MSG("Minimap Button is now hidden.")
			Centered:HideMMBtn("Centered")
		end,
		["dbkey"] = "MMBTN"
	})
end
