local cmp = require 'compass'
local parse = require 'parse'

local main = {}

main.coordlist = {
	home = { name = 'Home', latitude = 38.7138, longitude = -9.139 },
	{ name = 'Lisbon', latitude = 38.7138, longitude = -9.139 },
	{ name = 'Utrecht', latitude = 52.089167, longitude = 5.109722 },
	{ name = 'New York', latitude = 40.752726, longitude = -73.977229 },
}
main.coordlist = parse.deg2rad(main.coordlist)

main.coordlist = parse.addheaddist(main.coordlist)

main.tableprint = function()
	tex.print("The home coordinates are " .. cmp.rad2deg(main.coordlist.home.latitude) .. ", " .. cmp.rad2deg(main.coordlist.home.longitude))
	tex.print("\\par")

	tex.print("\\begin{center}\\begin{tabular}{l c c}\\toprule{}City & Heading & Distance \\\\\\midrule")
	for i = 1,#main.coordlist do
		tex.print(main.coordlist[i].name .. " & " .. cmp.rad2deg(main.coordlist[i].heading) .. " & " .. main.coordlist[i].distance .. "\\\\")
	end
	tex.print("\\bottomrule\\end{tabular}\\end{center}")
end

return main

