require_relative 'currency'
require_relative 'currency_converter'

class CurrencyTrader

  def initialize(currency, currency_converter_time1, currency_converter_time2)
    @currency = currency
    @currency_converter_time1 = currency_converter_time1
    @currency_converter_time2 = currency_converter_time2
  end

end
