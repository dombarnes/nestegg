class AnalyticsController < ApplicationController
  include AnalyticsHelper

  def index
    # @transactions = Transaction.unscoped.joins(:category).select("category_id, sum(amount) AS 'total'").where.not(category_id: nil).group('categories.name').order('total desc')
    @transactions = Transaction.unscoped.joins(:category).where.not(category_id: nil).group([:categories, :name]).sum(:amount)#.order('sum_amount desc')
    respond_to do |format|
      format.html
      format.js
    end
  end
end
