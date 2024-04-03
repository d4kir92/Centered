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
function SetupD4CEN()
	hooksecurefunc(
		PlayerFrame,
		"SetPoint",
		function(self, ...)
			if self.setpoint then return end
			self.setpoint = true
			sg = D4CENGetConfig("playergap", -8)
			sh = D4CENGetConfig("playerheight", 278)
			px1 = mathR(-PlayerFrame:GetWidth() / 2 - sg / 2, 0)
			py1 = sh
			self:SetMovable(true)
			self:SetUserPlaced(true)
			self:ClearAllPoints()
			self:SetPoint("CENTER", UIParent, "CENTER", px1, py1)
			self.setpoint = false
		end
	)

	hooksecurefunc(
		TargetFrame,
		"SetPoint",
		function(self, ...)
			if self.setpoint then return end
			self.setpoint = true
			sg = D4CENGetConfig("playergap", -8)
			sh = D4CENGetConfig("playerheight", 278)
			px2 = mathR(TargetFrame:GetWidth() / 2 + sg / 2, 0)
			py2 = sh
			self:SetMovable(true)
			self:SetUserPlaced(true)
			self:ClearAllPoints()
			self:SetPoint("CENTER", UIParent, "CENTER", px2, py2)
			self.setpoint = false
		end
	)

	if not InCombatLockdown() and not InVehicle() and D4CENGetConfig ~= nil then
		PlayerFrame:ClearAllPoints()
		PlayerFrame:SetPoint("CENTER", 0, 0)
		TargetFrame:ClearAllPoints()
		TargetFrame:SetPoint("CENTER", 0, 0)
	end
end