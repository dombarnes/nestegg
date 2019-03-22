class AnalyticsController < ApplicationController
  include AnalyticsHelper

  def index
    @categories = Category.unscoped.joins(:transactions).select("categories.name, sum(transactions.amount) as total").where("transactions.date > ?", Time.now - 1.year).group("categories.name").order("total ASC")
    respond_to do |format|
      format.html
      format.js
    end
  end
end
