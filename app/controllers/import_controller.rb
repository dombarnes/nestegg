class ImportController < ApplicationController
  
  def new
    @account = Account.find(params[:account_id])
  end

  def create
    Dir.mkdir(Rails.root.join('tmp', 'imported_files')) unless File.exists?(Rails.root.join('tmp', 'imported_files'))
    file_path = Rails.root.join('tmp', 'imported_files', SecureRandom.urlsafe_base64).to_s
    File.write(file_path, params[:file].read.encode!('UTF-16', 'UTF-8'))
    ImportTransactionsJob.perform_later(file_path, params[:account_id])
    redirect_to account_path(params[:account_id]), notice: 'Your import has been queued and will be ready shortly.'  
  end
    
end
