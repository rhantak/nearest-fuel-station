class NrelSearch
  def initialize(location)
    @location = location
  end
  def get_nearest_station
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?") do |request|
      request.params['location'] = location
    end
    JSON.parse(response.body)
  end

  def raw_location_data
    @raw_location_data ||= get_nearest_station['fuel_stations'].first
  end

  def station
    Station.new(raw_location_data)
  end

  private
  attr_reader :location

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.params['api_key'] = ENV['NREL_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
