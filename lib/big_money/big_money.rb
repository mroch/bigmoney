require 'bigdecimal'

class BigMoney
  VERSION = '0.2.1'

  class MoneyError < StandardError; end
  class UnknownCurrency < MoneyError; end
  class UncomparableCurrency < MoneyError; end

  @@default_currency = Currency::USD.instance
  def self.default_currency ; @@default_currency ; end
  def self.default_currency=(c) ; @@default_currency = c ; end
  def default_currency ; self.class.default_currency ; end
  def default_currency=(c) ; self.class.default_currency = c ; end

  attr_reader :amount, :currency

  def initialize(amount, currency = nil)
    @amount   = amount.class == BigDecimal ? amount : BigDecimal.new(amount.to_s)
    @currency = Currency.parse(currency || default_currency) or \
      raise UnknownCurrency, "Cannot parse '#{currency}'."
  end

  def eql?(other_money)
    currency == other_money.currency && amount == other_money.amount
  end

  def ==(other_money)
    eql?(other_money)
  end

  def <=>(other_money)
    raise UncomparableCurrency, "Cannot compare #{currency} to #{other_money.currency}" \
      unless currency == other_money.currency

    amount <=> other_money.amount
  end

  def -@
    BigMoney.new(-amount, currency)
  end

  def +(val)
    op(:+, val)
  end

  def -(val)
    op(:-, val)
  end

  def *(val)
    op(:*, val)
  end

  def /(val)
    op(:/, val)
  end

  def to_s
    to_formatted_s("%.#{currency.offset}f")
  end

  def to_formatted_s(format)
    format.sub(/%s/, currency.code) % amount
  end

  def to_i
    amount.to_i
  end

  def to_f
    amount.to_f
  end

  # Exchange to a new Currency.
  #
  #   BigMoney.new(12.50, :aud).exchange(:usd)
  def exchange(to)
    ex = amount * Exchange.rate(currency, to)
    BigMoney.new(ex, to)
  end

  # Short form BigMoney::Currency.parse(code) to save some typing.
  #
  #   BigMoney.currency(:usd) #=> BigMoney::Currency.parse(:usd)
  def self.currency(code)
    Currency.parse(code)
  end

private
  def op(s, val)
    if val.class == BigMoney
      raise UncomparableCurrency, "Cannot compare #{currency} to #{val.currency}" \
        unless currency == val.currency
      BigMoney.new(amount.send(s, val.amount), currency)
    else
      BigMoney.new(amount.send(s, val), currency)
    end
  end
end
