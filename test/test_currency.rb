require 'test/unit'
require 'big_money'

class TestCurrency < Test::Unit::TestCase
  def test_parse
    assert_kind_of BigMoney::Currency, BigMoney::Currency.parse(:aud)
    assert_nil BigMoney::Currency.parse(:fud)
  end

  def test_compare
    aud = BigMoney::Currency::AUD.instance
    assert_operator aud, :==, :aud
    assert_operator aud, :==, :AUD
    assert_operator aud, :==, 'aud'
    assert_operator aud, :==, 'AUD'

    # assert_operator aud, '!=', :fud
    assert aud != :fud
    assert aud != :FUD
    assert aud != 'fud'
    assert aud != 'FUD'
  end
end
