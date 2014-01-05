require 'spec_helper'

describe Owner do
  it { should have_valid(:first_name).when('Al') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Capone') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('BigAlC@gmail.com') }
  it { should_not have_valid(:email).when('Capone', 'al@', 'capone.com', nil, '') }

  it { should have_valid(:company).when('La Famiglia') }

  it { should have_many(:buildings) }
end
