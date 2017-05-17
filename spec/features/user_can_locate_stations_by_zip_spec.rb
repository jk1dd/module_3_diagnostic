# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=ENV[nrel_api_key]&location=80203&fuel_type=ELEC,LPG&limit=10&radius=6.0

require 'rails_helper'

feature 'User can locate stations' do
  context 'by entering zip' do
    scenario 'she can see 10 closest within 6 miles, only electric and propane' do
      VCR.use_cassette('user_locates') do
        # Capybara.app = AltFuelFinder::Application
        visit '/'
        # save_and_open_page

        fill_in "q", with: "80203"
        click_on "Locate"

        expect(current_path).to eq('/search')
        expect(page).to have_content("Name")
        expect(page).to have_content("Address")
        expect(page).to have_content("Fuel Types")
        expect(page).to have_content("Distance")
        expect(page).to have_content("Access Times")
      end
    end
  end
end
