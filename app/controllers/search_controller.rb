class SearchController < ApplicationController
  def index
    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&location=#{params["q"]}&fuel_type=ELEC,LPG&limit=10&radius=6.0"
    stuff = JSON.parse(response.body)
    binding.pry
    # @search =
  end
end
