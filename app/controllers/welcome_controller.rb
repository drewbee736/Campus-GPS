require './lib/map.rb'

class WelcomeController < ApplicationController
	before_filter :authorize

  def initialize
    @map = CampusMap.new()
    name_list = Building.order(:name).pluck(:id, :name)
		adjlist = Path.pluck(:start, :end, :distance)
		@map.load_map(adjlist)
    @notes = {}
    @notes['Select a building'] = nil
    name_list.sort.each do |id, name|
      @notes[name] = id
    end
  end

  def index
    if params[:start] != nil && params[:end] != nil && params[:start] != '<option value=' && params[:end] != '<option value='
      paths = @map.solve(params[:start].to_i, params[:end].to_i)
			@result = []
			paths.each do |id|
				node = Node.find(id)
				@result.push([node.latitude, node.longitude])
			end
			print @result
    end
  end

end
