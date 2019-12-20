class GoogleSearch
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_route
    response = conn.get("/maps/api/directions/json") do |request|
      request.params['origin'] = origin
      request.params['destination'] = destination
    end
    JSON.parse(response.body)
  end

  def raw_route_data
    @raw_route_data ||= get_route['routes'].first['legs'].first
  end

  def route
    Route.new(raw_route_data)
  end

  private
  attr_reader :origin, :destination

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |f|
      f.params['key'] = ENV['GOOGLE_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
