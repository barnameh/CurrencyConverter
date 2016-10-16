require_relative 'currency'

class CurrencyConverter

  def initialize(currency_code_hash = {"USD" => 1.0, "EUR" => 0.74})
    @currency_code_hash = currency_code_hash
  end

end
