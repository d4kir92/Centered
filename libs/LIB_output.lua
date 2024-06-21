local _, Centered = ...
-- LIB Output
if D4CENTAB == nil then
	D4CENTAB = {}
end

D4CENTAB.name = D4CENTAB.name or "X"
function pTab(tab)
	print("pTab", tab)
	for i, v in pairs(tab) do
		if type(v) == "table" then
			pTab(v)
		else
			print(i, v)
		end
	end

	print("----------------------------------")
end
