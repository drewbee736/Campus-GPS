require './lib/map.rb'

class WelcomeController < ApplicationController
	#before_filter :authorize

  def index
		#if @user.Home_Node
		map = CampusMap.new()
		@result = [[42.365965, -71.25981]]
    name_list = Building.order(:name).pluck(:id, :name)
		adjlist = Path.pluck(:start, :end, :distance)
		map.load_map(adjlist)
    @notes = {}
    name_list.sort_by{|id, name| name}.each do |id, name|
      @notes[name] = name
    end
		if params[:start] != nil && params[:end] != nil
			@result = []
			start_id = (Building.where(name: params[:start]))[0].id.to_i
			end_id = (Building.where(name: params[:end]))[0].id.to_i
			paths = map.solve(start_id, end_id)
			@strs = map.solve_text(start_id, end_id)
			paths.each do |id|
				node = Node.find(id)
				@result.push([node.latitude, node.longitude])
			end
    end
  end

	def route
		raw_text = params[:text]
		@strs = raw_text.split("\n")
		UserMailer.directions_email(User.current_user, raw_text).deliver
	end

	#def select_home
		#building_id = params[:select_home]
		#node = Node.find(building_id)
		#node.latitude, node.longitude
	#end

end
