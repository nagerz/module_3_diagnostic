class SearchFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stations
    response = NrelService.new(@zip_code).get_nearest_stations
    station_count = response[:total_results]
  end

  def nearest_stations(limit)
    stations = []
    response = NrelService.new(@zip_code).get_nearest_stations(limit)[:fuel_stations]
    response.map do |station_data|
      stations << Station.new(station_data)
    end
    stations
  end
end
