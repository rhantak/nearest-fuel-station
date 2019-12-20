require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit /' do
    describe 'and I select Turing and click Find Nearest Station' do
      before(:each) do
        visit root_path
        click_on 'Find Nearest Station'
      end

      it "I should be on the search page" do
        expect(current_path).to eq("/search")
      end

      it "I should see the nearest fuel station" do
        expect(page).to have_content('Name: Seventeenth Street Plaza')
        expect(page).to have_content('Address: 1225 17th St., Denver, CO 80202')
        expect(page).to have_content('Fuel Type: ELEC')
        expect(page).to have_content('Access Times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
      end

      it "I should see route information to that station" do
        expect(page).to have_content("Distance to Station: 0.1 mi")
        expect(page).to have_content("Travel Time: 1 min")
        expect(page).to have_content("Head southeast on 17th St toward Larimer St")
        expect(page).to have_content("Turn left onto Lawrence St")
        expect(page).to have_content("Destination will be on the left")
      end
    end
  end
end
