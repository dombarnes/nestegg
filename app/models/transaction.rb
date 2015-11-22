class Transaction < ActiveRecord::Base
	belongs_to :account
	has_many :categories

	validates :account_id, presence: true
	validates :date, presence: true
	validates :amount, presence: true
	validates :description, presence: true

	default_scope { order('date DESC') }

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Transaction.create! row.to_hash
		end
	end
end
