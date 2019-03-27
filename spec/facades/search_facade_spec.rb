require 'rails_helper'

RSpec.describe SearchFacade do
  before :each do
    @zip = '80206'
    @facade = SearchFacade.new(@zip)
  end

  it 'exists' do
    expect(facade).to be_a(SearchFacade)
  end

  context 'instance methods' do
    it 'returns an array of stations' do
      expect(@facade.all_stations.class).to eq(Array)

      @facade.all_stations.each do |station|
        expect(station.class).to eq(Station)
      end
    end
  end
end
