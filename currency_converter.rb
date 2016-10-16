require_relative 'currency'

class CurrencyConverter

  def initialize(currency_code_hash = {"USD" => 1.0, "EUR" => 0.74})
    @currency_code_hash = currency_code_hash
  end

  def convert(a_currency, a_currency_code)
    raise DifferentCurrencyCodeError if a_currency.currency_code != a_currency_code
    Currency.new(a_currency.amount, a_currency_code)
  end

end
