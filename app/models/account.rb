class Account < ActiveRecord::Base
has_many :transactions, dependent: :destroy

validates_presence_of :name, :balance, :opening_balance
default_scope { order('name ASC') }
end
