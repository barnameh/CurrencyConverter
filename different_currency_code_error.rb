class DifferentCurrencyCodeError < StandardError
  def initialize(msg="Two currencies don't have the same currency code")
    super
  end
end
