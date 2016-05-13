class Transaction < ActiveRecord::Base
  belongs_to :account
  has_many :categories

  validates :account_id, presence: true
  validates :date, presence: true
  validates :amount, presence: true
  validates :description, presence: true

  default_scope { order('date DESC') }
  scope :last_30_days, -> { where date: Time.now..30.days.ago }
  scope :last_3_months, -> { where date: Time.now..3.months.ago }

  FILTER = [ "All", "Last 30 days", "Last month", "Last 3 months" ]

  attr_accessor :file

  def self.import(file, headers)
    Ccsv.foreach(file.path) do |row|
      next if headers == true
      category = Category.find_or_create!(name: Hash[row][category])
      Transaction.create(Hash[row])
    end
  end
end
