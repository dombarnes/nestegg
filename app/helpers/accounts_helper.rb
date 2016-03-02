module AccountsHelper
  def number_to_currency_gb(number)
    number_to_currency(number, separator: ',', delimiter: '.'')
  end
end
