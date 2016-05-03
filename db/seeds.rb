require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

paths_file = File.read('paths.json')
path_hash = JSON.parse(paths_file)

path_hash.each do
  |path_info|
  path = path_info[1]
  _start = path[0]
  _end = path[1]
  _distance = path[2]

  Path.create(start:_start, end: _end, distance:_distance)
end

nodes_file = File.read('nodes.json')
nodes_hash = JSON.parse(nodes_file)

nodes_hash.each do
  |node_info|

  latlong = node_info[1]
  lat = latlong[0]
  long = latlong[1]
  Node.create(latitude:lat, longitude:long)
end

building_file = File.read('buildings.json')
building_hash = JSON.parse(building_file)

building_hash.each do
  |building_info|
  value = building_info[0]
  bname = building_info[1]

  Building.create(id:value, name:bname)
end

File.foreach('db/paths_to_string.txt') do |line|
  _start, _end, _description = line.split("\t")

  a = Path.where(start: _start, end: _end)[0]
  a.description = (_description.strip)[1..-2]
  a.save
 end
