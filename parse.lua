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
		for j, v in ipairs(fields) do
			if j == 3 then coord.name = v end
			if j == 7 then coord.latitude = v end
			if j == 8 then coord.longitude = v end
		end

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
	if not linelist then
		linelist = { 1 }
	elseif not linelist.home then
		linelist.home = { 1 }
	end

	local coordlist = {}

	for fields in file:lines() do
		coord = {}
		for i, v in ipairs(linelist) do
			if tonumber(fields[1]) == v then
				coord.name		= fields[3]
				coord.latitude	= tonumber(fields[7])
				coord.longitude	= tonumber(fields[8])
			end
		end

		if tonumber(fields[1]) == linelist.home then
			if coord.name and coord.latitude and coord.longitude then
				coordlist.home = coord
			end
		else
			table.insert(coordlist, coord)
		end
	end

	--[[
	for _, u in ipairs(coordlist) do
		for i, v in pairs(u) do
			print(i, v)
		end
	end
	--]]

	return coordlist
end

return parse

