require "bigdecimal"
require "bigdecimal/util"

module Xrechnung
  CurrencyLong = Struct.new(:currency_id, :value, keyword_init: true) do
    def value_to_s
      value.to_f.round(4)
    end

    def xml_args
      [value_to_s, currencyID: currency_id]
    end
  end

  class << CurrencyLong
    def EUR(value)
      raise ArgumentError, "value must respond to :to_d" unless value.respond_to? :to_d

      CurrencyLong.new(currency_id: "EUR", value: value.to_d)
    end
  end
end
