class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description, null: false
      t.decimal :amount, null: false
      t.datetime :date, null: false
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
