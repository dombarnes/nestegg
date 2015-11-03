class AddAccountIdToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :account_id, :integer, null: false
  end
end
