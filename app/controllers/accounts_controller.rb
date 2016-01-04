class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  
  def index
    @accounts = Account.all
    @net_worth = Account.sum(:balance)
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
    @account_name = @account.name
  end

  def create
    @account = Account.new(account_params)
    @account.balance = @account.opening_balance
    
    if @account.save
      @account.transactions.create(amount: @account.opening_balance, 
                                           date: Time.now, 
                                    description: "Opening Balance")
      AccountMailer.new_account(@account).deliver_later
      redirect_to account_transactions_path(@account), notice: 'Your new account was created. You can now add or import your transactions.'
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    DeleteAccountJob.perform_now @account
    redirect_to accounts_url, notice: 'Account was deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:name, :opening_balance, :balance, :overdraft, :organisation, :credit_interest, :debit_interest)
    end
end
