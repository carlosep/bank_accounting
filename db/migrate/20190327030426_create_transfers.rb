class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.decimal :amount
      t.references :source_account, index: true, foreign_key: { to_table: :accounts }
      t.references :destination_account, index: true, foreign_key: { to_table: :accounts }
      t.timestamps
    end
  end
end
