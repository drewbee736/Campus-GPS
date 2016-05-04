module WelcomeHelper
	def self.nearest_building_id(lag_lng, nearest=nil)
		if nearest
			lag_lng= self.nearest_facility(lag_lng, nearest)
			puts lag_lng, "hey!"
		end

		lag_lng[0] = lag_lng[0].to_f
		lag_lng[1] = lag_lng[1].to_f

		tempMinDist = Float::INFINITY
		minID = 0
		Building.all.pluck(:id).each do |b_id|
			if b_id<1111
				coord = [Node.find(b_id).latitude, Node.find(b_id).longitude]
				dist = self.geo_distance(lag_lng, coord)
				if dist < tempMinDist
					tempMinDist = dist
					minID = b_id
				end
			end
		end
		
		return minID, lag_lng
	end
#this is a very redundant method, but I couldn't figure out how to pass in a database as a parameter,
#so I had to make three separate conditionals to query different dbs
	def self.nearest_facility(lag_lng, nearest)
		tempMinDist = Float::INFINITY
		minID = 0
		if nearest == 0
			Nearestparking.all.each do |lot|
				coord = [lot.latitude, lot.longitude]
				dist = self.geo_distance(lag_lng, coord)

				if dist < tempMinDist
					tempMinDist = dist
					minID = lot.id
				end
			end

			return [Nearestparking.find(minID).latitude,Nearestparking.find(minID).longitude]
		elsif nearest ==1
			Nearestdining.all.each do |din|
				coord = [din.latitude, din.longitude]
				dist = self.geo_distance(lag_lng, coord)
				if dist < tempMinDist
					tempMinDist = dist
					minID = din.id
				end
			end
			return [Nearestdining.find(minID).latitude,Nearestdining.find(minID).longitude]
		else
			Nearestfit.all.each do |fit|
				coord = [fit.latitude, fit.longitude]
				dist = self.geo_distance(lag_lng, coord)
				if dist < tempMinDist
					tempMinDist = dist
					minID = fit.id
				end
			end
			return [Nearestfit.find(minID).latitude,Nearestfit.find(minID).longitude]
		end
	end


	def self.geo_distance(loc1, loc2)
  	rad_per_deg = Math::PI/180  # PI / 180
  	rkm = 6371                  # Earth radius in kilometers
  	rm = rkm * 1000             # Radius in meters

  	dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
  	dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

  	lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
  	lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

  	a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
  	c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

  	rm * c # Delta in meters
	end
end
