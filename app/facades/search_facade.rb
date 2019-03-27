class SearchFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stations
    response = NrelService.new(@zip_code).get_nearest_stations
    station_count = response[:station_counts][:total]
  end

  def nearest_stations
    stations = []
    response = NrelService.new(@zip_code).get_nearest_stations[:fuel_stations]
    response.map do |station_data|
      stations << Station.new(station_data)
    end
    stations
  end
end
