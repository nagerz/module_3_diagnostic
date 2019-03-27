class SearchFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stations
    response = NrelService.new(@zip_code).get_all_stations
    
    response.map do |station_data|
      Station.new(station_data)
    end
  end
end
