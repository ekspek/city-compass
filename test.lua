local cmp = require 'compass'
local test = {}

test.orig = { cmp.deg2rad(cmp.dms2deg(40, 45, 0)), cmp.deg2rad(cmp.dms2deg(-73, -58, 0)) }
test.p1 = { cmp.deg2rad(cmp.dms2deg(51, 32, 0)), cmp.deg2rad(cmp.dms2deg(0, -10, 0)) }

test.citylist = {
	{ name = 'Lisbon', heading = 10, distance = 1000000 },
	{ name = 'Utrecht', heading = 90, distance = 2000000 },
}

test.debug = function()
	tex.print("The coordinates are 40\\degree 45' N, 73\\degree 58' W")
	tex.print("\\par")
	tex.print("The heading to point 1 is " .. cmp.rad2deg(cmp.direction(test.orig, test.p1)) .. " from north.")
	tex.print("\\par")

	tex.print("\\begin{center}\\begin{tabular}{l c c}\\toprule{}City & Heading & Distance \\\\\\midrule")
	for i = 1,#test.citylist do
		tex.print(test.citylist[i].name .. " & " .. test.citylist[i].heading .. " & " .. test.citylist[i].distance .. "\\\\")
	end
	tex.print("\\bottomrule\\end{tabular}\\end{center}")
end

return test

