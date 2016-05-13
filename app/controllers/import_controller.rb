class ImportController < ApplicationController
  
  def new
  end

  def create
    @account ||= params[:account_id]
    @account.transactions.import(params[:file], :headers)
    redirect_to account_transactions_url, notice: 'Transactions imported.'
  end
    
end
