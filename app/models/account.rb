class Account < ActiveRecord::Base
  has_many :transactions, dependent: :destroy

  accepts_nested_attributes_for :transactions

  ACCOUNT_TYPE = ['Current Account', 'Credit Card', 'Savings']

  validates_presence_of :name, :balance, :opening_balance
  validates :name, uniqueness: true
  default_scope -> { order('name ASC') }

  def account_total
    opening_balance + transactions.sum(:amount)
  end

end
