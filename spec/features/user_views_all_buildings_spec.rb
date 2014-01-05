require 'spec_helper'

feature 'views all buildings', %Q{
  As a real estate associate
  I want to view all buildings
  So that I can see all the buildings' information at once
} do
  # Acceptance Criteria:
  # It must display street address, city, state, and postal code
  scenario 'user visits index page' do
    building1 = FactoryGirl.create(:building, address: '2 summer ave')
    building2 = FactoryGirl.create(:building, address: '3 summer ave')
    building3 = FactoryGirl.create(:building, address: '4 summer ave')
    visit '/buildings/'
    expect(page).to have_content("#{building1.address}")
    expect(page).to have_content("#{building2.address}")
    expect(page).to have_content("#{building3.address}")
  end
end
