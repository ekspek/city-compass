local cmp = require 'compass'
local parse = require 'parse'

local main = {}

--main.coordlist = parse.file('locations.csv')
main.coordlist = parse.openflights({ 8899, 8896, 9350, 502, 12880 })
main.coordlist.home = { latitude = 38.7813, longitude = -9.13592 }
main.coordlist = parse.deg2rad(main.coordlist)
main.coordlist = parse.addheaddist(main.coordlist)

main.tableprint = function()
	tex.print("The home coordinates are " .. cmp.rad2deg(main.coordlist.home.latitude) .. ", " .. cmp.rad2deg(main.coordlist.home.longitude))
	tex.print("\\par")

	tex.print("\\begin{center}\\begin{tabular}{l S S}\\toprule{}City & \\text{Heading} & \\text{Distance} \\\\\\midrule")
	for i = 1,#main.coordlist do
		tex.print(main.coordlist[i].name .. " & " .. cmp.rad2deg(main.coordlist[i].heading) .. " & " .. main.coordlist[i].distance .. "\\\\")
	end
	tex.print("\\bottomrule\\end{tabular}\\end{center}")
end

return main

