require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Associations' do
    context 'with several transfers' do
      let(:account) { create(:account) }
      it 'returns source transfers' do
        create(:transfer, source_account: account)
        expect(account.source_transfers.count).to eq(1)
      end
      it 'returns destination transfers' do
        create(:transfer, destination_account: account)
        expect(account.destination_transfers.count).to eq(1)
      end
      it 'returns all transfers' do
        2.times { create(:transfer, source_account: account) }
        2.times { create(:transfer, destination_account: account) }
        expect(account.transfers.count).to eq(4)
      end
    end
  end
end
