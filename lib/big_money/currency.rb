require 'singleton'

class BigMoney

  # Currency singleton objects.
  #
  # By default ISO4217 currency codes are known and registered with the factory. You'll need to sublcass Currency in
  # order to use non ISO4217 currencies.
  #
  #   class WOW < BigMoney::Currency
  #     self.name   = 'World of Warcraft Gold'
  #     self.code   = 'WOW'
  #     self.offset = 4
  #   end
  #
  #   bm = BigMoney.new(12.5020, :wow) # Would throw an UnknownCurrency error without the subclass.
  #   bm.to_s #=> 'WOW 12.5000' # 12 gold, 50 silver, 20 copper
  #
  # Currency singletons are comparable against itself, an upper or lowercase string or symbol of the currency code.
  #
  #  gold = WOW.instance
  #  gold == :wow  #=> true
  #  gold == 'wow' #=> true
  class Currency
    include Comparable
    include Singleton

    # Compare against another currency object, an upper or lowercase string or symbol of the currecy code.
    def <=>(value)
      code.to_s <=> value.to_s.upcase
    end

    # English currency name.
    def name
      self.class.name
    end

    # ISO 4217 3 letter currency code.
    def code
      self.class.code
    end

    # Number of decimal places to display by default.
    def offset
      self.class.offset
    end

    # Currency code.
    def to_s
      code.to_s
    end

    class << self
      attr_accessor :name, :code, :offset

      @@currencies = []
      def inherited(currency) #:nodoc:
        super
        @@currencies << currency
      end

      # All currencies. By default all current ISO4217 currencies.
      def all
        @@currencies.uniq
      end

      # Parse a currency instance, an upper or lowercase string or symbol of the currency code into a currency
      # object.
      def parse(value)
        all.find{|c| c.code == value.to_s.upcase}.instance rescue nil
      end
    end
  end # Currency

end # Money
