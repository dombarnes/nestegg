# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview
	def new_account_preview
    AccountMailer.new_account(Account.last)
  end
end
