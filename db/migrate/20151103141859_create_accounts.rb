class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.decimal :opening_balance, null: false
      t.decimal :balance, null: false
      t.decimal :overdraft
      t.string :organisation
      t.decimal :credit_interest
      t.decimal :debit_interest

      t.timestamps null: false
    end
  end
end
