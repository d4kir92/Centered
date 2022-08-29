-- By D4KiR

if D4CENTAB == nil then
	D4CENTAB = {}
end
D4CENTAB.name = "Centered UnitFrames"
D4CENTAB.colorname = "|c008888ff"
D4CENTAB.author = "D4KiR"
D4CENTAB.colorauthor = "|c0000ffff"

SetCVar("ScriptErrors", 1)

function D4CENGetConfig(str, val)
	local setting = val

	D4CEN = D4CEN or {}

	if D4CEN[str] == nil then
		D4CEN[str] = val
	end
	setting = D4CEN[str]

	return setting
end
