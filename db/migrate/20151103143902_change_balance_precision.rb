class ChangeBalancePrecision < ActiveRecord::Migration
  def change
  	change_column :accounts, :balance, :decimal, precision: 8, scale: 2
  end
end
