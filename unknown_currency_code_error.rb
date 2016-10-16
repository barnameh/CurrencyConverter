class UnknownCurrencyCodeError < StandardError
  def initialize(msg="There is no entry for the specified currency code")
    super
  end
end
