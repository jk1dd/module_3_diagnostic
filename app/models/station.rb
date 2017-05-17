class Station
  def initalize(zip)
    @zip = zip
  end

  def self.stations
    NrelService.new(zip).find_stations
  end

  private
  attr_reader :zip
end
