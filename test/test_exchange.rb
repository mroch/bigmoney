require 'test/unit'
require 'big_money'

class TestExchange < Test::Unit::TestCase
  def setup
    @aud = BigMoney.currency(:aud)
    @usd = BigMoney.currency(:usd)
  end

  def test_rate
    assert_kind_of BigDecimal, BigMoney::Exchange.rate(@aud, @usd)
    assert_kind_of BigDecimal, BigMoney::Exchange.rate(:aud, :usd)
    assert_raise BigMoney::UnknownCurrency do
      BigMoney::Exchange.rate(:aud, :fud)
    end
  end
end
