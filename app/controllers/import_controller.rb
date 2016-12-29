class ImportController < ApplicationController
  
  def new
    @account = Account.find(params[:account_id])
  end

  def create
    Dir.mkdir(Rails.root.join('tmp', 'imported_files')) unless File.exists?(Rails.root.join('tmp', 'imported_files'))
    file_path = Rails.root.join('tmp', 'imported_files', SecureRandom.urlsafe_base64).to_s
    # Write file to local filesystem until its processed
    File.write(file_path, params[:file].read.encode!('utf-8', 'windows-1252'))
    ImportTransactionsJob.perform_now(file_path, params[:account_id], params[:headers])
    redirect_to account_path(params[:account_id]), notice: 'Your import has been queued and will be ready shortly.'  
  end
    
end
