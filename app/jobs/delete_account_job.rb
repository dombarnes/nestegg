class DeleteAccountJob < ActiveJob::Base
  queue_as :default

  def perform(account)
    Rails.logger.info "About to delete #{account} and associated records..."
    account.destroy
    Rails.logger.info '...delete finished.''
  end
end
