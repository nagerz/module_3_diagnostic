class SearchFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stations
    response = ["data1", "data2"]
    response.map do |station_data|
      Station.new(station_data)
    end
  end
end
