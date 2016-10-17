require_relative 'currency'
require_relative 'currency_converter'

class CurrencyTrader

  def initialize(currency, time1_currency_converter, time2_currency_converter)
    @currency = currency
    @time1_currency_converter = time1_currency_converter
    @time2_currency_converter = time2_currency_converter
  end

  def best_currency_investment
    best_roi = 0
    best_currency_code = ""
    @time1_currency_converter.conversion_rates.each_key do |key|
      if key == @currency.currency_code
        next
      end
      time1_currency = @time1_currency_converter.convert(@currency, key)
      time2_currency = @time2_currency_converter.convert(time1_currency, @currency.currency_code)
      p key
      p time2_currency
      return_on_investment = time2_currency.amount - @currency.amount
      if best_roi < return_on_investment
        best_roi = return_on_investment
        best_currency_code = key
      end
    end
    return best_currency_code
  end
end
