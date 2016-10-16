require_relative 'different_currency_code_error'
class Currency

  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def amount
    @amount
  end

  def currency_code
    @currency_code
  end

  def same_currency_code(a_currency)
    if @currency_code == a_currency.currency_code
      true
    else
      false
    end
  end

  def ==(a_currency)
    raise DifferentCurrencyCodeError if !same_currency_code(a_currency)
    if @amount == a_currency.amount && @currency_code == a_currency.currency_code
      true
    else
      false
    end
  end

  def +(a_currency)
    raise DifferentCurrencyCodeError if !same_currency_code(a_currency)
    Currency.new(amount + a_currency.amount, currency_code)
  end

  def -(a_currency)
    raise DifferentCurrencyCodeError if !same_currency_code(a_currency)
    Currency.new(amount - a_currency.amount, currency_code)
  end

  def *(a_number)
    raise DifferentCurrencyCodeError if !((a_number.instance_of? Fixnum)|| (a_number.instance_of? Float))
    Currency.new(amount * a_number, currency_code)
  end
end
