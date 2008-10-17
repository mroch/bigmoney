require 'open-uri'

class BigMoney
  class Exchange
    class Yahoo < Exchange
      class << self
        def read_rate(from, to)
          s = [from, to].map{|c| c.code}.join
          open("http://download.finance.yahoo.com/d/quotes.csv?s=#{s}=X&f=l1&e=.csv").read.strip rescue nil
        end

        def currencies
          %w{
            ALL DZD XAL ARS AWG AUD BSD BHD BDT BBD BYR BZD BMD BTN BOB BWP BRL GBP BND BGN BIF KHR CAD CVE KYD XOF XAF
            CLP CNY COP KMF XCP CRC HRK CUP CYP CZK DKK DJF DOP XCD ECS EGP SVC ERN EEK ETB EUR FKP FJD GMD GHC GIP XAU
            GTQ GNF GYD HTG HNL HKD HUF ISK INR IDR IRR IQD ILS JMD JPY JOD KZT KES KRW KWD LAK LVL LBP LSL LRD LYD LTL
            MOP MKD MWK MYR MVR MTL MRO MUR MXN MDL MNT MAD MMK NAD NPR ANG TRY NZD NIO NGN KPW NOK OMR XPF PKR XPD PAB
            PGK PYG PEN PHP XPT PLN QAR RON RUB RWF WST STD SAR SCR SLL XAG SGD SKK SIT SBD SOS ZAR LKR SHP SDD SZL SEK
            CHF SYP TWD TZS THB TOP TTD TND USD AED UGX UAH UYU VUV VEB VND YER ZMK ZWD
          }
        end
      end
    end # Yahoo
  end # Exchange
end # Money

