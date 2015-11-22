class AccountMailer < ApplicationMailer

	def new_account(account)
		@message = "Your new account, #{account.name}, has been created You can now add or import transactions."
    mail(to: 'domster83@gmail.com',
         subject: 'New Account Created')
	end
end
