require 'rails_helper'

RSpec.describe SearchFacade do
  before :each do
    @zip = '80206'
    @facade = SearchFacade.new(@zip)
  end

  it 'exists' do
    expect(@facade).to be_a(SearchFacade)
  end

  context 'instance methods' do
    it 'returns an count of total stations' do
      expect(@facade.all_stations.class).to eq(Integer)
      expect(@facade.all_stations).to eq(87)
    end

    it 'returns an array of stations' do
      expect(@facade.nearest_stations.class).to eq(Array)

      @facade.nearest_stations.each do |station|
        expect(station.class).to eq(Station)
      end
    end
  end
end
