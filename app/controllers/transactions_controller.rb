class TransactionsController < ApplicationController
  before_action :require_login
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.send(params[:timeframe] || 'all').joins(:account).paginate(page: params[:page])
  end

  def show
    @account = @transaction.account    
  end

  def new
    @transaction = Transaction.new
  end

  def edit
  end

  def create
    @transaction = @account.transactions.new(transaction_params)
    @transaction.balance += @transaction.amount
    if @transaction.save
      @account.save!
      @account.balance = @transaction.balance
      redirect_to account_transactions_path(@account), notice: 'Transaction saved!'
    else
      render :new
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to account_transactions_path(@account), notice: 'Transaction updated!'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to account_url, notice: 'Transaction was successfully deleted.'
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :amount, :date, :category_id, :account_id)
  end
end
