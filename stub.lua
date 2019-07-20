local parse = require 'parse'

--coordlist = parse.file('locations.csv')
coordlist = parse.openflights({ 8899, 8896, 9350, 502, home = 9715 })

---[[
for _, u in ipairs(coordlist) do
	for i, v in pairs(u) do
		print(i, v)
	end
end
--]]
