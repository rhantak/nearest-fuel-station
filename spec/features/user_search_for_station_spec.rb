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

      xit "I should see the nearest fuel station" do
        #name
        #address
        #fuel type
        #access times
      end

      xit "I should see route information to that station" do
        #distance to station
        #travel time
        #directions to station
      end
    end
  end
end
