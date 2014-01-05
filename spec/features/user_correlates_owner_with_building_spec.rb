require 'spec_helper'

feature 'user correlates building with owner', %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do
  # Acceptance Criteria:

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'user associates building with owner' do
    owner = FactoryGirl.create(:owner)
    visit '/buildings/new'
    fill_in 'Address', with: '33 Harrison Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'Postal code', with: '01201'
    select 'MA', from: 'State'

    select "#{owner.first_name} #{owner.last_name}", from: 'Owner'
    click_button 'Create Building'
    expect(owner.buildings.count) == 1
    expect(Building.last.owner.first_name) == owner.first_name
  end

  scenario 'user deletes owner and it is not associated with property' do
    FactoryGirl.create(:building)
    visit '/owners/'
    click_link 'Delete'
    expect(Building.last.owner_id).to be_nil
  end
end
