class UpdateAccountTotalsJob < ActiveJob::Base
  queue_as :default

  def perform
    @accounts = Account.all
    @accounts.each do |account|
      account.balance = account.account_total
      account.save
    end
  end
end
