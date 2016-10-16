require_relative 'currency'
require_relative 'unknown_currency_code_error'

class CurrencyConverter

  def initialize(currency_code_hash = {"USD" => 1.0, "EUR" => 0.74})
    @currency_code_hash = currency_code_hash
  end

  def currency_code_hash
    @currency_code_hash
  end

  def convert(a_currency, a_currency_code)
    if a_currency.currency_code == a_currency_code
      Currency.new(a_currency.amount, a_currency_code)
    elsif (currency_code_hash.has_key? a_currency.currency_code) &&
          (currency_code_hash.has_key? a_currency_code)
      new_currency_amount = a_currency.amount * (currency_code_hash[a_currency.currency_code] / currency_code_hash[a_currency_code])
      Currency.new(new_currency_amount, a_currency_code)
    else
      raise UnknownCurrencyCodeError
    end
  end

end
