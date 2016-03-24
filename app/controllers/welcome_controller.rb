require './lib/map.rb'

class WelcomeController < ApplicationController
	before_filter :authorize

  def initialize
    @map = CampusMap.new()
    @map.load_buildings("./db/buildings.txt")
    @map.load_paths("./db/paths.txt")
    name_list = @map.get_all_nodes_name
    @notes = {}
    @notes['Select a building'] = nil
    name_list.sort.each do |name|
      @notes[name] = name
    end
  end

  def index
    if params[:start] != nil && params[:end] != nil && params[:start] != '<option value=' && params[:end] != '<option value='
      startP = @map.get_node_id(params[:start])
      endP = @map.get_node_id(params[:end])
      @result = @map.solve(startP, endP).html_safe
    end
  end

end
