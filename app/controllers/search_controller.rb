class SearchController < ApplicationController
  def index
    @stations = Station.stations(params["q"])
  end
end
