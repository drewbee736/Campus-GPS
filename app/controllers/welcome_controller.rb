require './lib/map.rb'

class WelcomeController < ApplicationController

  def initialize
    @map = CampusMap.new()
    @map.load("./lib/buildings.txt", "./lib/paths.txt")
  end

  def index
    @notes = ["volen", "ziv 127", "gzang"]
    if params[:start] != nil && params[:end] != nil
      startP = @map.get_node_id(params[:start])
      endP = @map.get_node_id(params[:end])
      @result = @map.solve(startP, endP).html_safe
    end
  end

end
