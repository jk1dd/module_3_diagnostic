class Station
  def initialize(attrs = {})
    @attrs = attrs
  end

  def self.stations(zip)
    NrelService.new(zip).find_stations[:fuel_stations].map do |station|
      new(station)
    end
  end

  def station_name
    attrs[:station_name]
  end

  def street_address
    attrs[:street_address]
  end

  def fuel_type_code
    attrs[:fuel_type_code]
  end

  def distance
    attrs[:distance]
  end

  def access_days_time
    attrs[:access_days_time]
  end

  private
  attr_reader :attrs
end
