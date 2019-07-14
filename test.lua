local cmp = require 'compass'
local test = {}

test.orig = { cmp.deg2rad(cmp.dms2deg(40, 45, 0)), cmp.deg2rad(cmp.dms2deg(-73, -58, 0)) }
test.p1 = { cmp.deg2rad(cmp.dms2deg(51, 32, 0)), cmp.deg2rad(cmp.dms2deg(0, -10, 0)) }

test.debug = function()
	tex.print("The coordinates are 40\\degree 45' N, 73\\degree 58' W\\par")
	tex.print("The heading to point 1 is " .. cmp.rad2deg(cmp.direction(test.orig, test.p1)) .. " from north.")
end

return test

