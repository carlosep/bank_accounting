require 'rails_helper'

RSpec.describe Transfer, type: :model do
  let(:source) { build(:account) }
  let(:destination) { build(:account) }

  describe '#update_accounts_balances!' do
    context 'successfully' do
      it "updates accounts' balances" do
        transfer = build(:transfer, source_account: source, destination_account: destination)
        transfer.send(:update_accounts_balances!)
        expect(source.current_balance).to eq 0
        expect(destination.current_balance).to eq 2000
      end
    end
  end

  describe '#enough_funds?' do
    context 'source account has enough funds' do
      it 'returns true' do
        transfer = build(:transfer, amount: 1000.00, source_account: source)
        expect(transfer.enough_funds?).to be_truthy
      end
    end
    context 'source account does not have enough funds' do
      it 'returns false' do
        transfer = build(:transfer, amount: 1000.01, source_account: source)
        expect(transfer.enough_funds?).to be_falsy
      end
    end
  end
end
