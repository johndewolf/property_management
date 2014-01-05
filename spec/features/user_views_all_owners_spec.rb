require 'spec_helper'

feature 'views all buildings', %Q{
  As a real estate associate
  I want to view all owners
  So that I can see all the owners' information at once
} do
  # Acceptance Criteria:
  # It must display first name, last name, and email for each owner
  scenario 'user visits index page' do
    owner1 = FactoryGirl.create(:owner, first_name: 'Tal')
    owner2 = FactoryGirl.create(:owner, first_name: 'Cal')
    owner3 = FactoryGirl.create(:owner, first_name: 'Sal')
    visit '/owners/'
    expect(page).to have_content(owner1.first_name)
    expect(page).to have_content(owner2.first_name)
    expect(page).to have_content(owner3.first_name)
  end
end
