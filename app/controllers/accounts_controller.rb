class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :update_balance, only: :show
  def index
    @accounts = Account.all
    @net_worth = Account.sum(:balance)
    @transactions = Transaction.limit(10)
  end

  def show
    @transactions = @account.transactions.includes(:category).paginate(page: params[:page])
  end

  def new
    @account = Account.new
  end

  def edit
    @account_name = @account.name
  end

  def create
    @account = Account.new(account_params)
    @account.balance = @account.opening_balance # replace this with a balance calculation after save
    if @account.save
      AccountMailer.new_account(@account).deliver_now
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

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :account_type, :opening_balance, :balance, :overdraft, :organisation, :credit_interest, :debit_interest)
  end
  
  def update_balance
    @account.balance = @account.account_total
    @account.save
  end
end
