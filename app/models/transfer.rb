class Transfer < ApplicationRecord
  belongs_to :source_account, class_name: 'Account'
  belongs_to :destination_account, class_name: 'Account'

  before_save :update_account_balance

  def update_account_balance
    source = self.source_account
    destination = self.destination_account
    if source.current_balance >= self.amount
      destination.current_balance += self.amount
      source.current_balance -= self.amount
      destination.save!
      source.save!
    else
      raise 'Source account has no funds!'
    end
  end
end
