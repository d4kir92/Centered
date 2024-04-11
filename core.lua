local _, Centered = ...
-- By D4KiR
local CENBUILD = "CLASSIC"
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

function InVehicle()
	if CENBUILD ~= "RETAIL" then
		return false
	else
		return UnitInVehicle("PLAYER")
	end
end

local sg = -999999
local sh = -999999
local px1, py1, px2, py2
function Centered:Update()
	if not InCombatLockdown() and not InVehicle() and D4CENGetConfig ~= nil then
		PlayerFrame:ClearAllPoints()
		PlayerFrame:SetPoint("CENTER", 0, 0)
		TargetFrame:ClearAllPoints()
		TargetFrame:SetPoint("CENTER", 0, 0)
	end
end

function Centered:Setup()
	hooksecurefunc(
		PlayerFrame,
		"SetPoint",
		function(sel, ...)
			if sel.setpoint then return end
			sel.setpoint = true
			sg = D4CENGetConfig("playergap", -8)
			sh = D4CENGetConfig("playerheight", 278)
			px1 = mathR(-PlayerFrame:GetWidth() / 2 - sg / 2, 0)
			py1 = sh
			sel:SetMovable(true)
			sel:SetUserPlaced(true)
			sel:ClearAllPoints()
			sel:SetPoint("CENTER", UIParent, "CENTER", px1, py1)
			sel.setpoint = false
		end
	)

	hooksecurefunc(
		TargetFrame,
		"SetPoint",
		function(sel, ...)
			if sel.setpoint then return end
			sel.setpoint = true
			sg = D4CENGetConfig("playergap", -8)
			sh = D4CENGetConfig("playerheight", 278)
			px2 = mathR(TargetFrame:GetWidth() / 2 + sg / 2, 0)
			py2 = sh
			sel:SetMovable(true)
			sel:SetUserPlaced(true)
			sel:ClearAllPoints()
			sel:SetPoint("CENTER", UIParent, "CENTER", px2, py2)
			sel.setpoint = false
		end
	)

	Centered:Update()
end