local _, Centered = ...
-- By D4KiR
function D4CENGetConfig(str, val)
	local setting = val
	D4CEN = D4CEN or {}
	if D4CEN[str] == nil then
		D4CEN[str] = val
	end

	setting = D4CEN[str]

	return setting
end
