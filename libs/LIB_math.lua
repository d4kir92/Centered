local _, Centered = ...
-- LIB Math
function mathR(num, dec)
	dec = dec or 2

	return tonumber(string.format("%." .. dec .. "f", num))
end

function RGBToDec(rgb)
	return mathR(rgb / 255, 2)
end