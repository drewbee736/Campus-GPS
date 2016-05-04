# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


File.foreach('db/paths.txt') do |line|
  _start, _end, _distance = line.split("\t")
  a = Path.new
  a.start = _start.to_i
  a.end = _end.to_i
  a.distance = _distance.to_i
  a.save
end

File.foreach('db/buildings.txt') do |line|
  id, name = line.split(',')
  a = Building.new
  a.id = id.to_i
  a.name = name.strip
  a.save
end

File.foreach('db/node coordinates.txt') do |line|
  id, coordinates = line.split(' ')
  a = Node.new
  a.id = id.to_i
  x, y = coordinates.split(',')
  a.latitude = x.to_f
  a.longitude = y.to_f
  a.save
end

dining_file = File.read('dining.json')
dining_hash = JSON.parse(dining_file)

dining_hash.each do
  |info|
  latlong = info[1]
  value = info[0]
  name = latlong[0]
  lat = latlong[1]
  long = latlong[2]
  Nearestdining.create(id: value,latitude:lat, longitude:long, name:value)
end

fitness_file = File.read('fitness.json')
fitness_hash = JSON.parse(fitness_file)

fitness_hash.each do
  |info|
  latlong = info[1]
  value = info[0]
  name = latlong[0]
  lat = latlong[1]
  long = latlong[2]
  Nearestfit.create(id: value, latitude:lat, longitude:long, name:value)
end

parking_file = File.read('parking.json')
parking_hash = JSON.parse(parking_file)

parking_hash.each do
  |info|
  latlong = info[1]
  value = info[0]
  name = latlong[0]
  lat = latlong[1]
  long = latlong[2]
  Nearestparking.create(id: value, latitude:lat, longitude:long, name:value)
end


File.foreach('db/paths_to_string.txt') do |line|
  _start, _end, _description = line.split("\t")
  print _start
  print _end
  print _description
  a = Path.where(start: _start.strip.to_i, end: _end.strip.to_i)[0]
  a.description = (_description.strip)[1..-2]
  a.save
end
