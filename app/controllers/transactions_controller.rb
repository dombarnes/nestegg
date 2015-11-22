class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_account

  def index
    @transactions = @account.transactions
    # .paginate(page: params[:page])
  end

  def show
  end

  def new
    @transaction = @account.transactions.new
  end

  def edit
  end

  def create
    @transaction = @account.transactions.new(transaction_params)
    @account.balance += @transaction.amount
    @transacaction.balance = @acount.balance
      
    if @transaction.save
      @account.save!
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
    redirect_to account_transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  def import
    Transaction.import(params[:file])
    redirect_to root_url, notice: "Transactions imported."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:description, :amount, :date, :category_id, :account_id)
    end
end
