require 'test/unit'
require 'big_money'
require 'bigdecimal'

class TestBigMoney < Test::Unit::TestCase
  
  def test_initialize_with_bigdecimal
    val = BigDecimal.new("1.005")
    assert_same val, BigMoney.new(val).amount, 'Should not create a clone of the input'
  end
  
  def test_initialize_with_string
    assert_equal BigDecimal.new("1.005"), BigMoney.new("1.005").amount
    assert_equal BigDecimal.new("10"), BigMoney.new("10").amount
    assert_equal BigDecimal.new("0"), BigMoney.new("0").amount
    assert_equal BigDecimal.new("0"), BigMoney.new("foo").amount
  end
  
  def test_initialize_with_integer
    assert_equal BigDecimal.new("100"), BigMoney.new(100).amount
    assert_equal BigDecimal.new("0"), BigMoney.new(0).amount
  end
  
  def test_initialize_with_float
    assert_equal BigDecimal.new("1.005"), BigMoney.new(1.005).amount
    assert_equal BigDecimal.new("0"), BigMoney.new(0.0).amount
  end
  
  def test_eql?
    assert BigMoney.new("1.00", :usd).eql?(BigMoney.new("1.00", :usd))
    assert !BigMoney.new("1.00", :usd).eql?(BigMoney.new("1.01", :usd))
    assert !BigMoney.new("1.00", :usd).eql?(BigMoney.new("1.00", :cad))
  end
  
  def test_compare
    m1, m2 = BigMoney.new("1.00", :usd), BigMoney.new("1.50", :usd)
    assert_equal(-1, (m1 <=> m2))
    assert_equal(0, (m1 <=> m1))
    assert_equal(1, (m2 <=> m1))
    
    m3 = BigMoney.new("1.00", :cad)
    assert_raises BigMoney::UncomparableCurrency do
      m1 <=> m3
    end
  end
  
  def test_add
    m1, m2, m3 = BigMoney.new(1.00, :usd), BigMoney.new(1.50, :usd), BigMoney.new(0, :usd)
    assert_equal BigDecimal.new("2.50"), (m1 + m2).amount
    assert_equal BigDecimal.new("2.50"), (m2 + m1).amount
    assert_equal BigDecimal.new("1.00"), (m1 + m3).amount
    assert_equal BigDecimal.new("1.00"), (m3 + m1).amount
    assert_not_same m1, m1 + m3
    assert_not_same m1, m3 + m1
    assert_equal BigDecimal.new("5.50"), (m2 + 4).amount
    assert_equal BigDecimal.new("5.50"), (m2 + 4.00).amount
  end
  
  def test_subtract
    m1, m2, m3 = BigMoney.new(1.00, :usd), BigMoney.new(1.50, :usd), BigMoney.new(0, :usd)
    assert_equal BigDecimal.new("-0.50"), (m1 - m2).amount
    assert_equal BigDecimal.new("0.50"), (m2 - m1).amount
    assert_equal BigDecimal.new("1.00"), (m1 - m3).amount
    assert_equal BigDecimal.new("-1.00"), (m3 - m1).amount
    assert_equal BigDecimal.new("-2.50"), (m2 - 4).amount
    assert_equal BigDecimal.new("-2.50"), (m2 - 4.00).amount
  end
  
  def test_multiply
    m1, m2, m3 = BigMoney.new(2.00, :usd), BigMoney.new(1.50, :usd), BigMoney.new(0, :usd)
    assert_equal BigDecimal.new("4.00"), (m1 * m1).amount
    assert_equal BigDecimal.new("3.00"), (m1 * m2).amount
    assert_equal BigDecimal.new("3.00"), (m2 * m1).amount
    assert_equal BigDecimal.new("0"), (m1 * m3).amount
    assert_equal BigDecimal.new("0"), (m3 * m1).amount
    assert_equal BigDecimal.new("0"), (m3 * m3).amount
    assert_equal BigDecimal.new("3.00"), (m2 * 2).amount
    assert_equal BigDecimal.new("3.00"), (m2 * 2.00).amount
  end
  
  def test_divide
    m1, m2, m3 = BigMoney.new(2.00, :usd), BigMoney.new(1.50, :usd), BigMoney.new(0, :usd)
    assert_equal BigDecimal.new("1.00"), (m1 / m1).amount
    assert_equal BigDecimal.new("1.3333333333333334"), (m1 / m2).amount
    assert_equal BigDecimal.new("0.75"), (m2 / m1).amount
    assert_equal BigDecimal.new("0"), (m3 / m1).amount
    assert((m1 / m3).amount.infinite?)
    assert((m3 / m3).amount.nan?)
    assert((m1 / 0).amount.infinite?)
    assert((m3 / 0).amount.nan?)
    assert_equal BigDecimal.new("0.75"), (m2 / 2).amount
    assert_equal BigDecimal.new("0.75"), (m2 / 2.00).amount
  end
  
  def test_to_s
    assert_equal '1.00', BigMoney.new(1).to_s
    assert_equal '1.50', BigMoney.new(1.5).to_s
    assert_equal '-11.50', BigMoney.new(-11.5).to_s
  end
  
  def test_to_formatted_s
    assert_equal '1.00', BigMoney.new(1).to_formatted_s("%.2f")
    assert_equal '$1.00', BigMoney.new(1).to_formatted_s("$%.2f")
    assert_equal 'USD $1.00', BigMoney.new(1).to_formatted_s("%s $%.2f")
    assert_equal '$1.00 USD', BigMoney.new(1).to_formatted_s("$%.2f %s")
    assert_equal '$1 USD', BigMoney.new(1).to_formatted_s("$%.0f %s")
    assert_equal '$1.00 <span class="currency">USD</span>', BigMoney.new(1).to_formatted_s('$%.2f <span class="currency">%s</span>')
  end
  
  def test_to_i
    assert_equal(1, BigMoney.new(1).to_i)
    assert_equal(1, BigMoney.new(1.5).to_i)
    assert_equal(-11, BigMoney.new(-11.5).to_i)
  end
  
  def test_to_f
    assert_in_delta(1.0, BigMoney.new(1).to_f, 0.000001)
    assert_in_delta(1.5, BigMoney.new(1.5).to_f, 0.000001)
    assert_in_delta(-11.5, BigMoney.new(-11.5).to_f, 0.000001)
  end
  
  def test_neg
    assert_equal BigMoney.new(-1), -BigMoney.new(1)
    assert_equal BigMoney.new(1),  -BigMoney.new(-1)
    assert_equal BigMoney.new(1),  -BigMoney.new(-1)
  end

end