class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :current_balance, default: 0

      t.timestamps
    end
  end
end
