local csv = require 'lua-csv.lua.csv'
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

parse.file = function(filename)
	local file = csv.open(filename)

	local coordlist = {}

	for fields in file:lines() do
		local coord = {}
		coord.name		= fields[3]
		coord.latitude	= tonumber(fields[7])
		coord.longitude	= tonumber(fields[8])

		if not coordlist.home then
			if coord.name and coord.latitude and coord.longitude then
				coordlist.home = coord
			end
		else
			table.insert(coordlist, coord)
		end
	end

	return coordlist
end

parse.openflights = function(linelist)
	local file = csv.open('./openflights/data/airports-extended.dat')
	if not linelist then linelist = { 1 } end
	if not linelist.home then linelist.home = { 1 } end

	local coordlist = {}

	for fields in file:lines() do
		coord = {}
		for i, v in ipairs(linelist) do
			if tonumber(fields[1]) == v or tonumber(fields[1]) == linelist.home then
				coord.name		= fields[3]
				coord.latitude	= tonumber(fields[7])
				coord.longitude	= tonumber(fields[8])
			end
		end

		if tonumber(fields[1]) == linelist.home then
			coordlist.home = coord
		else
			table.insert(coordlist, coord)
		end
	end

	return coordlist
end

return parse

