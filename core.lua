-- By D4KiR
function InVehicle()
	if CENBUILD ~= "RETAIL" then
		return false
	else
		return UnitInVehicle("PLAYER")
	end
end

if D4CENTAB == nil then
	D4CENTAB = {}
end

local sg = -999999
local sh = -999999
local px1, py1, px2, py2

hooksecurefunc(PlayerFrame, "SetPoint", function(self, ...)
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
end)

PlayerFrame:SetPoint("CENTER", 0, 0)

hooksecurefunc(TargetFrame, "SetPoint", function(self, ...)
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
end)

TargetFrame:SetPoint("CENTER", 0, 0)

function SetupD4CEN()
	if not InCombatLockdown() and not InVehicle() and D4CENTABloaded and D4CENGetConfig ~= nil then
		PlayerFrame:ClearAllPoints()
		PlayerFrame:SetPoint("CENTER", 0, 0)
		TargetFrame:ClearAllPoints()
		TargetFrame:SetPoint("CENTER", 0, 0)
	end
end