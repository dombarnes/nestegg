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
  scope :last_month, -> { where date: Time.now.last_month.beginning_of_month..Time.now.last_month.end_of_month}
  scope :last_quarter, -> { where date: Time.now.beginning_of_month..Time.now.end_of_month}

  FILTER = {
        "All" => "all",
        "Last 30 days" => "last_30_days",
        "Last Month" => "last_month",
        "Last quarter" => "last_quarter"
      }

  attr_accessor :file

end
