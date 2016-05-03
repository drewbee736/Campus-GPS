require 'json'
dining_file = File.read('dining.json')
dining_hash = JSON.parse(dining_file)
dining_hash.each do
  |info|

  latlong = info[1]
  value = info[0]
  lat = latlong[0]
  long = latlong[1]
  print value, lat, long, "\n"
end
