require './lib/map.rb'

class WelcomeController < ApplicationController
	#before_filter :authorize

  def index

		map = CampusMap.new()
		@result = [[42.365965, -71.25981]]
    name_list = Building.order(:name).pluck(:id, :name)
		adjlist = Path.pluck(:start, :end, :distance)
		map.load_map(adjlist)
    @notes = {}
    name_list.sort_by{|id, name| name}.each do |id, name|
      @notes[name] = name
    end
		if params[:start] != nil && params[:end] != nil && params[:end] != ""
      @result = []
			if params[:start] != ""
				start_id = (Building.where(name: params[:start]))[0].id.to_i
			else

        lat_lng = cookies[:lat_lng].split("|")
				start_id = WelcomeHelper.nearest_building_id(lat_lng)[0]
				@result.push(lat_lng)
			end

      if params[:end].starts_with? "nearest"

        if params[:end].ends_with? "parking"
          nearest = 0
        elsif params[:end].ends_with? "dining"
          nearest = 1
        elsif params[:end].ends_with? "athletics"
          nearest = 2
        else
          nearest = nil
        end
        e_id = WelcomeHelper.nearest_building_id(lat_lng, nearest)
        end_id = e_id[0]
        nearest_facility = e_id[1]
        if start_id!=end_id
          paths = map.solve(start_id, end_id)
    			@strs = map.solve_text(start_id, end_id)
    			paths.each do |id|
    				node = Node.find(id)
    				@result.push([node.latitude, node.longitude])
    			end

        end
        print @result, "here!"
        @result.push(nearest_facility)
        print @result, "here after!"
      else
        end_id = (Building.where(name: params[:end]))[0].id.to_i
  			paths = map.solve(start_id, end_id)
  			@strs = map.solve_text(start_id, end_id)
  			paths.each do |id|
  				node = Node.find(id)
  				@result.push([node.latitude, node.longitude])
  			end
      end
    end

  end

	def route
		raw_text = params[:text]
		@strs = raw_text.split("\n")
		UserMailer.directions_email(User.current_user, raw_text).deliver
	end


end
