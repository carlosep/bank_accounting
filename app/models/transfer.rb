class Transfer < ApplicationRecord
  belongs_to :source_account, class_name: 'Account'
  belongs_to :destination_account, class_name: 'Account'

  before_save :update_accounts_balances!

  def update_accounts_balances!
    destination_account.increment!(:current_balance, amount)
    source_account.decrement!(:current_balance, amount)
  end

  def enough_funds?
    source_account.current_balance >= amount
  end
end
