function direction(p1in, p2in)
	-- Import two coordinates as tables
	p1.lat = p1[1]
	p1.lon = p1[2]
	p2.lat = p2[1]
	p2.lon = p2[2]

	-- Radial distance between the two points
	local raddist = math.acos(math.cos(p2.lat) * math.cos(p1.lon - p2.lon) * math.cos(p1.lat) + math.sin(p2.lat) * math.sin(p1.lat))

	-- Heading at departure (relative to north)
	local heading1 = math.atan((-math.cos(p2.lat) * math.sin(p1.lon - p2.lon)) / (-math.cos(p2.lat) * math.cos(p1.lon - p2.lon) * math.sin(p1.lat) + math.sin(p2.lat) * math.cos(p1.lat)))

	-- Heading at arrival (relative to north)
	local heading2 = math.atan((-math.cos(p1.lat) * math.sin(p1.lon - p2.lon)) / (math.sin(p2.lat) * math.cos(p1.lon - p2.lon) * math.cos(p1.lat) - math.cos(p2.lat) * math.sin(p1.lat)))

	return heading1
	--return heading2
	--return raddist * 6378000
end

function dms2deg(d, m, s)
	local deg = d + (m / 60) + (s / 3600)
	return deg
end

function deg2rad(deg)
	local rad = deg * math.pi / 180
	return rad
end

function rad2deg(rad)
	local deg = rad * 180 / math.pi
	return rad
end

p1 = { deg2rad(dms2deg(40, 45, 0)), deg2rad(dms2deg(-73, -58, 0)) }
p2 = { deg2rad(dms2deg(51, 32, 0)), deg2rad(dms2deg(0, -10, 0)) }
print(direction(p1, p2))
