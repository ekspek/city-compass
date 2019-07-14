function direction(p1, p2)
	-- Import two coordinates as tables
	local p1.lat = p1[1]
	local p1.lon = p1[2]
	local p2.lat = p2[1]
	local p2.lon = p2[2]

	-- Radial distance between the two points
	local raddist = math.acos(math.cos(p2.lat) * math.cos(p1.lon - p2.lon) * math.cos(p1.lat) + math.sin(p2.lat) * math.sin(p1.lat))

	-- Heading at departure (relative to north)
	local heading1 = math.atan((-math.cos(p2.lat) * math.sin(p1.lon - p2.lon)) / (-math.cos(p2.lat) * math.cos(p1.lon - p2.lon) * math.sin(p1.lat) + math.sin(p2.lat) * math.cos(p1.lat)))

	-- Heading at arrival (relative to north)
	local heading2 = math.atan((-math.cos(p1.lat) * math.sin(p1.lon - p2.lon)) / (math.sin(p2.lat) * math.cos(p1.lon - p2.lon) * math.cos(p1.lat) - math.cos(p2.lat) * math.sin(p1.lat)))

	return heading1
end

function dms2deg(d, m, s)
	local deg = d + (m / 60) + (s / 3600)
	return deg
end

function deg2rad(deg)
	local rad = deg * math.pi / 180
	return rad
end
