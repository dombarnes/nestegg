class Transaction < ActiveRecord::Base
belongs_to :account
belongs_to :category

validates_presence_of :account
default_scope { order('date DESC') }

end
