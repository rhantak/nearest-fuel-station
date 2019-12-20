class Route
  attr_reader :distance, :duration, :directions
  
  def initialize(route_data)
    @distance = route_data['distance']['text']
    @duration = route_data['duration']['text']
    @directions = route_data['steps']
  end
end
