class Account < ApplicationRecord
  has_many :source_transfers, class_name: 'Transfer', foreign_key: 'source_account'
  has_many :destination_transfers, class_name: 'Transfer', foreign_key: 'destination_account'

  def transfers
    Transfer.where('source_account_id = ? OR destination_account_id = ?', id, id)
  end
end
