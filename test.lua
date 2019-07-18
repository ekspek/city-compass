local cmp = require 'compass'
local test = {}

test.orig = { latitude = cmp.deg2rad(cmp.dms2deg(40, 45, 0)), longitude = cmp.deg2rad(cmp.dms2deg(-73, -58, 0)) }
test.p1 = { latitude = cmp.deg2rad(cmp.dms2deg(51, 32, 0)), longitude = cmp.deg2rad(cmp.dms2deg(0, -10, 0)) }

test.coordlist = {
	{ name = 'Lisbon', latitude = 38.7138, longitude = -9.139 },
	{ name = 'Utrecht', latitude = 52.089167, longitude = 5.109722 },
	{ name = 'New York', latitude = 40.752726, longitude = -73.977229 },
}

homecoord = { latitude = cmp.deg2rad(38.7138), longitude = cmp.deg2rad(-9.139) }

test.citylist = {}
for i = 1,#test.coordlist do
	test.coordlist[i].latitude = cmp.deg2rad(test.coordlist[i].latitude)
	test.coordlist[i].longitude = cmp.deg2rad(test.coordlist[i].longitude)
	test.citylist[i] = {
		name = test.coordlist[i].name,
		heading = cmp.heading(homecoord, test.coordlist[i]),
		distance = cmp.distance(homecoord, test.coordlist[i]),
	}
end

test.debug = function()
	tex.print("The coordinates are 40\\degree 45' N, 73\\degree 58' W")
	tex.print("\\par")
	tex.print("The heading to point 1 is " .. cmp.rad2deg(cmp.heading(test.orig, test.p1)) .. " from north.")
	tex.print("\\par")

	tex.print("\\begin{center}\\begin{tabular}{l c c}\\toprule{}City & Heading & Distance \\\\\\midrule")
	for i = 1,#test.citylist do
		tex.print(test.citylist[i].name .. " & " .. cmp.rad2deg(test.citylist[i].heading) .. " & " .. test.citylist[i].distance .. "\\\\")
	end
	tex.print("\\bottomrule\\end{tabular}\\end{center}")
end

return test

