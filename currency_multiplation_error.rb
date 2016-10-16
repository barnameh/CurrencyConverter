class CurrencyMultiplicationError < StandardError
  def initialize(msg="Expecting a number (Fixnum or Float)")
    super
  end
end
