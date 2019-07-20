local parse = require 'parse'

--coordlist = parse.file('locations.csv')
coordlist = parse.openflights({1, 2, 3, 4, 6})

for _, u in ipairs(coordlist) do
	for i, v in pairs(u) do
		print(i, v)
	end
end
