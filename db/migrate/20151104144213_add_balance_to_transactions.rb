class AddBalanceToTransactions < ActiveRecord::Migration
  def change
  	add_column :transactions, :balance, :decimal, null: false, default: 0
  end
end
