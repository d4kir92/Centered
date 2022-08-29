-- LIB Output

if D4CENTAB == nil then
	D4CENTAB = {}
end
D4CENTAB.name = D4CENTAB.name or "X"

function D4CENTABmsg(str)
	print("|c0000ffff" .. "[" .. "|cff8888ff" .. D4CENTAB.name .. "|c0000ffff" .. "] " .. str)
end

function D4CENTABdeb(str)
	if D4CENTABdebUG then
		print("[DEB] " .. str)
	end
end

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
