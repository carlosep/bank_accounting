require 'rails_helper'

describe 'Authentication' do
  let(:account) { create(:account) }
  let(:user) { create(:user) }

  context 'successfull' do
    it 'allow request' do
      get "/api/v1/accounts/#{account.id}/balance?token=#{user.token}"
      expect(response.status).to eq 200
    end
  end
  context 'having an invalid token' do
    it 'denies request' do
      get "/api/v1/accounts/0/balance"
      expect(response.status).to eq 401
      expect(response.body).to include('Not Authorized. Check your acccess token')
    end
  end
end
