local cmp = require 'compass'
local parse = require 'parse'

local main = {}

local round = function(n)
	return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

--main.coordlist = parse.file('locations.csv')
main.coordlist = parse.openflights({ 8899, 8896, 9350, 502, 12880, 803, 1872, 3320, 6048, 3550 })
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

main.drawcompass = function()
	tex.print([[
		\begin{tikzpicture}
			\node at (0,0) [circle, draw] {Test Node};
	]])
	for i = 1,#main.coordlist do
		tex.print([[\node at (]] .. round(90 - cmp.rad2deg(main.coordlist[i].heading)) .. [[:7) [circle, draw, align = center] {]] .. main.coordlist[i].name .. [[\\\SI{]] .. round(main.coordlist[i].distance / 1000) .. [[}{\kilo\meter}\\$]] .. round(cmp.rad2deg(main.coordlist[i].heading)) ..[[\degree$};]])
	end
	tex.print([[
			\path [red, thick, draw, ->] (0,0) -- (90:7);
		\end{tikzpicture}
	]])
end

return main

