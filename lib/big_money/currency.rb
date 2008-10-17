require 'singleton'

class BigMoney
  class Currency
    include Comparable
    include Singleton

    def <=>(value)
      code.to_s <=> value.to_s.upcase
    end

    def name
      self.class.name
    end

    # ISO 4217 3 letter currency code.
    def code
      self.class.code
    end

    def offset
      self.class.offset
    end

    def to_s
      code.to_s
    end

    class << self
      attr_accessor :name, :code, :offset

      @@currencies = []
      def inherited(currency)
        super
        @@currencies << currency
      end

      def all
        @@currencies.uniq
      end

      def parse(value)
        all.find{|c| c.code == value.to_s.upcase}.instance rescue nil
      end
    end
  end # Currency
end # Money
