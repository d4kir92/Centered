-- LIB Design

if D4CENTAB == nil then
	D4CENTAB = {}
end

lang = lang or {}

function D4CENTABGT(str, tab)
	local strid = string.lower(str)
	local result = lang[strid]
	if result ~= nil then
		if tab ~= nil then
			for i, v in pairs(tab) do
				local find = i -- "[" .. i .. "]"
				local replace = v
				if find ~= nil and replace ~= nil then
					result = string.gsub(result, find, replace)
				end
			end
		end
		return result
	else
		return str
	end
end

function D4CENTABUpdateLanguage()
	D4CENTAB.Lang_enUS()
	if GetLocale() == "enUS" then
		--D4CENTABmsg("Translation found! [enUS (English)]")
		D4CENTAB.Lang_enUS()
	elseif GetLocale() == "deDE" then
		--D4CENTABmsg("Translation found! [deDE (Deutsch)]")
		D4CENTAB.Lang_deDE()
	elseif GetLocale() == "frFR" then
		D4CENTAB.Lang_frFR()
	elseif GetLocale() == "ruRU" then
		D4CENTAB.Lang_ruRU()
	end
end
D4CENTABUpdateLanguage()
