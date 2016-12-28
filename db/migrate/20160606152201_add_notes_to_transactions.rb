class AddNotesToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :notes, :string, null: true
  end
end
