require 'spec_helper'

feature 'user creates a building', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do
  # Acceptance Criteria:
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner
  scenario 'create owner with valid attributes' do
    visit '/owners/new'
    fill_in 'First name', with: 'Bal'
    fill_in 'Last name', with: 'Capone'
    fill_in 'Email', with: 'BigAlC@yahoo.com'
    click_button 'Submit owner'
    expect(page).to have_content('Owner successfully submitted')
  end

  scenario 'create owner with invalid attributes' do
    visit '/owners/new'
    click_button 'Submit owner'
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email does not appear to be valid")
  end

  scenario 'user is directed to page to create new owner after successful submit' do
    visit '/owners/new'
    fill_in 'First name', with: 'Hal'
    fill_in 'Last name', with: 'Capone'
    fill_in 'Email', with: 'BigAlC@yahoo.com'
    click_button 'Submit owner'
    expect(page).to have_content('Submit new owner:')
  end

end
