-- By D4KiR

if D4CENTAB == nil then
	D4CENTAB = {}
end
D4CENTAB.name = "Centered |T132222:16:16:0:0|t by |cff3FC7EBD4KiR |T132115:16:16:0:0|t"

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
