class NrelService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def get_all_stations
    response = conn.get("alt-fuel-stations/v1/nearest")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov/api/") do |faraday|
      faraday.params["format"] = "json"
      faraday.params["api_key"] = ENV["api_key"]
      faraday.params["status"] = "E"
      faraday.params["access"] = "public"
      faraday.params["fuel_type"] = "ELEC, LPG"
      faraday.params["radius"] = 5.0
      faraday.params["location"] = @zip_code
      faraday.adapter Faraday.default_adapter
    end
  end
end
