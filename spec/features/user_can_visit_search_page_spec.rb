require 'rails_helper'

RSpec.describe 'Search page' do
  #As a user
  describe 'As a user' do
    it 'I can search for a zip code and see results' do
      zip = '80206'
      # When I visit "/"
      visit '/'
      # And I fill in the search form with 80206 (Note: Use the existing search form)
      fill_in :q, :with => zip

      # And I click "Locate"
      click_on "Locate"

      # Then I should be on page "/search"
      expect(current_path).to eq(search_path)

      # Then I should see the total results of the stations that match my query.
      expect(page).to have_content("Query Stations:")

      within '.total-stations' do
        expect(page).to have_css(".station", count: 4)
        expect(page).to have_content("Total Stations (4):")

        within(first(".station")) do
          expect(page).to have_css(".name")
          expect(page).to have_css(".address")
          expect(page).to have_css(".fuel-types")
          expect(page).to have_css(".distance")
          expect(page).to have_css(".access-times")
        end
      end
      # Then I should see a list of the 15 closest stations within 5 miles sorted by distance
      # And the stations should be limited to Electric and Propane
      # fuel_type = ELEC, LPG
      # And the stations should only be public, and not private, planned or temporarily unavailable.
      # access = public, status = E
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    end
  end

end
