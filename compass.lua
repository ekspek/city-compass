local compass = {}

compass.direction = function(p1in, p2in)
	-- Import two coordinates as tables
	local p1 = {}
	local p2 = {}
	p1.lat = p1in[1]
	p1.lon = p1in[2]
	p2.lat = p2in[1]
	p2.lon = p2in[2]

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

compass.dms2deg = function(d, m, s)
	local deg = d + (m / 60) + (s / 3600)
	return deg
end

compass.deg2rad = function(deg)
	local rad = deg * math.pi / 180
	return rad
end

compass.rad2deg = function(rad)
	local deg = rad * 180 / math.pi
	return rad
end

return compass

