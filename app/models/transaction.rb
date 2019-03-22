class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  validates :account_id, presence: true
  validates :date, presence: true
  validates :amount, presence: true
  validates :description, presence: true

  default_scope { order('date DESC') }
  scope :age, ->(age) { where date: (Time.now - (age.to_i).days)..Time.now }
  
  scope :last_30_days, -> { where date: 30.days.ago..Time.now }
  scope :last_3_months, -> { where date: 3.months.ago..Time.now }
  scope :last_month, -> { where date: Time.now.last_month.beginning_of_month..Time.now.last_month.end_of_month }
  scope :last_quarter, -> { where date: (Time.now - 3.months).beginning_of_month..Time.now.end_of_month }
  scope :last_year, -> { where date: (Time.now - 1.year).beginning_of_month..Time.now.end_of_month } 
  
  FILTER = {
    'All' => 'all',
    'Last 30 days' => 'last_30_days',
    'Last Month' => 'last_month',
    'Last quarter' => 'last_quarter'
  }

  attr_accessor :file

  def self.search(search)
    where("lower(description) LIKE lower(?)", "%#{search}%")
  end
end
