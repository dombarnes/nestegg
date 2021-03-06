class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_account, only: [:show, :edit]

  after_action :update_account_balance, only: [:create, :update, :destroy]

  def index
    @transactions = Transaction.where(nil)
    filtering_params(params).each do |key, value|
      @transactions = @transactions.public_send(key, value) if value.present?
    end
    @transactions = @transactions.joins(:account).joins(:category).paginate(page: params[:page])
  end

  def search
    @transactions = Transaction.search(params[:search]).order('created_at DESC').joins(:account).paginate(page: params[:page])
  end

  def show
    @account = @transaction.account
  end

  def new
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.new
  end

  def edit
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      # @account.balance = @transaction.balance
      redirect_to account_path(@transaction.account), notice: 'Transaction saved!'
    else
      render :new
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to account_path(@transaction.account), notice: 'Transaction updated!'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to account_path(@transaction.account_id), notice: 'Transaction was successfully deleted.'
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(
      :description, 
      :amount, 
      :date, 
      :category_id, 
      :account_id, 
      :notes
    )
  end

  def update_account_balance
    @account = @transaction.account
    @account.balance = @account.account_total
  end

  def filtering_params(params)
    params.slice(:age)
  end
end
