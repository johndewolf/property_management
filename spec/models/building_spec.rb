require 'spec_helper'

describe Building do
  it { should have_valid(:address).when('33 Harrison Ave') }
  it { should_not have_valid(:address).when('', nil) }

  it { should have_valid(:city).when('Boston') }
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('MA') }
  it { should_not have_valid(:state).when('', nil) }

  it { should have_valid(:postal_code).when('02111') }
  it { should_not have_valid(:postal_code).when('', nil, '01232334') }

  it { should have_valid(:description).when('house looks awesome') }
  it { should have_valid(:description).when('', nil) }

  it { should have_valid(:owner_id).when(1, 15) }
  it { should have_valid(:owner_id).when('', nil) }

  it { should belong_to(:owner) }
end
