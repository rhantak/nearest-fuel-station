class NrelSearch
  def get_nearest_station(location)
    conn.get("/nearest.json") do |request|
      request.params['location'] = location
    end
  end
  
  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1") do |f|
      f.params['api_key'] = ENV['NREL_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
