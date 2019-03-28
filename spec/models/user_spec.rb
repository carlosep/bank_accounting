require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(create(:user).token).not_to be_nil }
end
