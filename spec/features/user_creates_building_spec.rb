require 'spec_helper'

feature 'user creates a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do
  # Acceptance Criteria:
  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'create building with valid attributes' do
    visit '/buildings/new'
    fill_in 'Address', with: '33 Harrison Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'Postal code', with: '01201'
    select 'MA', from: 'State'
    click_button 'Create Building'
    expect(page).to have_content('Building successfully created')
  end

  scenario 'fail to create building and show errors with invalid attributes' do
    visit '/buildings/new'
    click_button 'Create Building'
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Postal code can't be blank")
  end

  scenario 'it redirects to page to enter in another building after a successful submit' do
    visit '/buildings/new'
    fill_in 'Address', with: '33 Harrison Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'Postal code', with: '01201'
    select 'MA', from: 'State'
    click_button 'Create Building'
    expect(page).to have_content('New Building:')
  end
end
