local cmp = require 'compass'
local test = {}

test.p1 = { cmp.deg2rad(cmp.dms2deg(40, 45, 0)), cmp.deg2rad(cmp.dms2deg(-73, -58, 0)) }
test.p2 = { cmp.deg2rad(cmp.dms2deg(51, 32, 0)), cmp.deg2rad(cmp.dms2deg(0, -10, 0)) }

test.print = function()
	tex.print(cmp.direction(test.p1, test.p2))
end

return test

