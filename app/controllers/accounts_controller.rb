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
      AccountMailer.new_account(@account).deliver_later
      redirect_to @account, notice: 'Account was successfully created.'
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
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
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
