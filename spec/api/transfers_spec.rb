require 'rails_helper'

describe BankAccounting::V1::Transfers do
  describe 'POST /api/v1/transfers' do
    let(:account1) { create(:account) }
    let(:account2) { create(:account) }

    context 'successfully' do
      let(:params) do
        { transfer: { source_account_id: account1.id,
                      destination_account_id: account2.id,
                      amount: 0 } }
      end
      it 'transfer money between accounts' do
        params[:transfer][:amount] = 500
        expect { post '/api/v1/transfers', params: params }
          .to change(account2, current_balance).by(+500)
        expect(response.status).to eq 201
        expect(response.body).to include('Money transfer was successfull')
        expect(Transfer.last.amount).to eq(500)
        expect(account1.current_balance).to eq(500)
      end
    end

    context 'having an account with insufficient funds' do
      it 'cancels money transfer' do
        params[:transfer][:amount] = 1500
        post '/api/v1/transfers', params: params
        expect(response.status).to eq 400
        expect(response.body).to include('Source account has insufficient funds')
        expect(account1.current_balance).to eq(1000)
        expect(account2.current_balance).to eq(1000)
      end
    end
  end
end
