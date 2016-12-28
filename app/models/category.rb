class Category < ActiveRecord::Base
  has_many :transactions
  
  belongs_to :parent, class_name: "Category"
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  validates :name, presence: true
  default_scope { order('name ASC') }

  def parent_name
    name = ("(" + Category.find(self.parent_id).name + ")") unless parent_id.nil?
  end

  def total_with_sub_categories
    self.transactions.sum(:amount) + self.children.includes(:transactions).sum(:amount)
  end
end
