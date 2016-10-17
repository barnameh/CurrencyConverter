require_relative 'different_currency_code_error'
require_relative 'currency_multiplation_error'

class Currency

  @@currency_symbols_hash = {"$" => "USD", "€" => "EUR", "¥" => "JPY", "£" => "GBP"}

  def initialize(*args)
    if args.size == 2
      raise ArgumentError if !((args[0].instance_of? Fixnum) || (args[0].instance_of? Float))
      @amount = args[0]
      raise ArgumentError if !args[1].instance_of? String
      @currency_code = args[1]
    elsif args.size == 1
      # currency symbol is embedded in the ammount (like "$1.20" or "€ 7.00")
      raise ArgumentError if !args[0].instance_of? String
      # first get the currency symbol
      currency_symbol = args[0].chr
      raise ArgumentError if !(@@currency_symbols_hash.has_key?(currency_symbol))
      @currency_code = @@currency_symbols_hash[currency_symbol]
      # now get the amount
      amount_arg_string = args[0].slice(1, args[0].size - 1)
      @amount = amount_arg_string.to_f
    else
      raise ArgumentError
    end
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

  def !=(a_currency)
    !(self.==(a_currency))
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
    raise CurrencyMultiplicationError if !((a_number.instance_of? Fixnum)|| (a_number.instance_of? Float))
    Currency.new(amount * a_number, currency_code)
  end
end
