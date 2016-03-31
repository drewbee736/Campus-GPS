require './lib/map.rb'

class WelcomeController < ApplicationController
	before_filter :authorize

  def index
		#if @user.Home_Node

		@map = CampusMap.new()
		@result = [[42.365965, -71.25981]]
    name_list = Building.order(:name).pluck(:id, :name)
		adjlist = Path.pluck(:start, :end, :distance)
		@map.load_map(adjlist)
    @notes = {}
    @notes['Select a building'] = nil
    name_list.sort_by{|id, name| name}.each do |id, name|
      @notes[name] = id
    end
    if params[:start] != nil && params[:end] != nil && params[:start] != '<option value=' && params[:end] != '<option value='
			@result = []
      paths = @map.solve(params[:start].to_i, params[:end].to_i)
			paths.each do |id|
				node = Node.find(id)
				@result.push([node.latitude, node.longitude])
			end
    end
  end

	def select_home
		building_id = params[:select_home]
		node = Node.find(building_id)
		node.latitude, node.longitude
	end

end
