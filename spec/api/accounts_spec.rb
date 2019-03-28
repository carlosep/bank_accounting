require 'rails_helper'

describe BankAccounting::V1::Accounts do
  let(:account1) { create(:account) }
  let(:account2) { create(:account) }
  let(:user) { create(:user) }

  describe 'GET /api/v1/accounts/:id/balance' do
    context 'successfully' do
      it 'displays account balance' do
        get "/api/v1/accounts/#{account1.id}/balance?token=#{user.token}"
        expect(response.status).to eq 200
        expect(response.body).to include(account1.current_balance.to_s)
      end
    end
    context 'having an inexistent account' do
      it 'Informs that the account does not exist' do
        get "/api/v1/accounts/0/balance?token=#{user.token}"
        expect(response.status).to eq 400
        expect(response.body).to include('This account does not exist.')
      end
    end
  end
end
