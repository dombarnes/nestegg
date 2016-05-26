class ImportTransactionsJob < ActiveJob::Base
  queue_as :file_import

  class DateConverter
    def self.convert(value)
      Date.strptime( value, '%d/%m/%Y') # parses custom date format into Date instance
    end
  end  
  class CurrencyConverter
    def self.convert(value)
      value.gsub(/\xC2\xA3/,'').to_i
    end
  end

  def perform(file, account_id)
    Rails.logger.debug "*** Begining file import #{file} ***"
    file = File.open(file, "r:bom|utf-8")
    @error_rows = []
    SmarterCSV.process(file, value_converters: {date:DateConverter, amount: CurrencyConverter} ).each do |row|
      c = Category.find_or_create_by(name: row[:category])
      t = Transaction.new(account_id: account_id, category_id: c.id, description: row[:description].to_s, date: row[:date], amount: row[:amount].to_f)
      next if Transaction.exists?(t)
      if !t.valid?
        @error_rows += {row: row[:date], error: t.errors.messages}
      else
        t.save!
      end
    end
    Rails.logger.debug '*** Import complete. Deleting temp file ***'
    File.delete(file)
    Rails.logger.debug '*** Temp file deleted ***'
    Rails.logger.debug @error_rows
  end

end
