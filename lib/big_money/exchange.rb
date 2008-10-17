require 'bigdecimal'

class BigMoney
  class Exchange
    class ExchangeError < StandardError; end
    class ConversionError < ExchangeError; end

    class << self
      @@services = []
      def inherited(service)
        @@services << service
      end

      def rate(from, to)
        exchange = [from, to].map do |c|
          Currency.parse(c) or raise BigMoney::UnknownCurrency
        end

        service = @@services.reverse.find do |service|
          !!exchange.reject{|c| service.currencies.include?(c)}
        end

        service or raise ConversionError # TODO: Message?
        BigDecimal.new(service.read_rate(*exchange))
      end

      protected
        # Exchange rate from the first currency to the second.
        def read_rate(from, to)
          raise NotImplementedError
        end

        # An array of supported currencies.
        def currencies
          raise NotImplementedError
        end
    end
  end # Exchange
end # Money
