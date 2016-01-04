class Account < ActiveRecord::Base
has_many :transactions, dependent: :destroy

accepts_nested_attributes_for :transactions

validates_presence_of :name, :balance, :opening_balance
validates :name, uniqueness: true
default_scope -> { order('name ASC') }
end
