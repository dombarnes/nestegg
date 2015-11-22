class AddIndexToTransactions < ActiveRecord::Migration
  def change
  	add_index :transactions, :account_id
  end
end
