class Transaction < ActiveRecord::Base
  belongs_to :account
  has_many :categories

  validates :account_id, presence: true
  validates :date, presence: true
  validates :amount, presence: true
  validates :description, presence: true

  default_scope { order('date DESC') }

  attr_accessor :file

  def self.import(file, headers)
    Ccsv.foreach(file.path) do |row|
      next if headers == true
      Transaction.create(Hash[row])
    end
  end
end
