class ImportTransactionsJob < ActiveJob::Base
  queue_as :file_import

  class DateConverter
    def self.convert(value)
      Date.strptime(value, '%d/%m/%y') # parses custom date format into Date instance
    end
  end  
  class CurrencyConverter
    def self.convert(value)
      value.to_s.sub(/[£]/,'').to_f
    end
  end
  
  def perform(file, account_id, headers)
    Rails.logger.debug "*** Begining file import ***"
    f = File.open(file, "r:bom|utf-8")
    @error_rows = []
    options = {
      row_sep: :auto,
      # remove_empty_values: false, 
      remove_zero_values: false,
      # remove_values_matching: /^\r$/,
      value_converters: {date:DateConverter, amount: CurrencyConverter}
    }
    SmarterCSV.process(f, options).each do |row|
      Rails.logger.debug "Processing row #{row}"
      category = Category.find_or_create_by(name: row[:category]).id unless row[:category].nil?
      t = Transaction.create(
        account_id: account_id, 
        category_id: category, 
        description: row[:description].to_s, 
        date: row[:date],
        amount: row[:amount].to_f, 
        )
      # next if Transaction.exists?(t)
      if !t.valid?
        @error_rows += {row: row, error: t.errors.messages}
      else
        t.save!
      end
    end
    f.close
    Rails.logger.debug '*** Import complete. Deleting temp file ***'
    File.delete(f)
    Rails.logger.debug '*** Temp file deleted ***'
    Rails.logger.debug "*** Errored rows: #{@error_rows} ***"
  end

end
