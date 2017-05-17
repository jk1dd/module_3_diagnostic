require 'rails_helper'

feature 'User can locate stations' do
  context 'by entering zip' do
    scenario 'she can see 10 closest within 6 miles, only electric and propane' do
      VCR.use_cassette('user_locates') do
        visit '/'

        fill_in "q", with: "80203"
        click_on "Locate"

        expect(current_path).to eq('/search')
        within('.station-info') do
          expect(page).to have_content("Name: UDR")
          expect(page).to have_content("Address: 800 Acoma St")
          expect(page).to have_content("Fuel Types: ELEC")
          expect(page).to have_content("Distance: 0.31422")
          expect(page).to have_content("Access Times: 24 hours daily")
        end
        
        expect(page).to have_content("Name:", count: 10)
      end
    end
  end
end
