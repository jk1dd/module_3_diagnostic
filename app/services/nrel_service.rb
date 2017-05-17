class NrelService
  def initialize(zip)
    @zip = zip
    @key = ENV['nrel_api_key']
    @_conn = Faraday.new('https://developer.nrel.gov')
  end

  def find_stations
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{key}&location=#{zip}&fuel_type=ELEC,LPG&limit=10&radius=6.0")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :key, :zip

  def conn
    @_conn
  end
end
