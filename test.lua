local cmp = require 'compass'

p1 = { cmp.deg2rad(cmp.dms2deg(40, 45, 0)), cmp.deg2rad(cmp.dms2deg(-73, -58, 0)) }
p2 = { cmp.deg2rad(cmp.dms2deg(51, 32, 0)), cmp.deg2rad(cmp.dms2deg(0, -10, 0)) }
print(cmp.direction(p1, p2))

