local cmp = require 'compass'

local parse = {}

parse.addheaddist = function(coordlist)
	for i = 1,#coordlist do
		coordlist[i].heading = cmp.heading(coordlist.home, coordlist[i])
		coordlist[i].distance = cmp.distance(coordlist.home, coordlist[i])
	end

	return coordlist
end

parse.deg2rad = function(coordlist)
	coordlist.home.latitude = cmp.deg2rad(coordlist.home.latitude)
	coordlist.home.longitude = cmp.deg2rad(coordlist.home.longitude)

	for i = 1,#coordlist do
		coordlist[i].latitude = cmp.deg2rad(coordlist[i].latitude)
		coordlist[i].longitude = cmp.deg2rad(coordlist[i].longitude)
	end

	return coordlist
end

return parse

