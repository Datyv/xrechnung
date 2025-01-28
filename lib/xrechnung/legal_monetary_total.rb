module Xrechnung
  class LegalMonetaryTotal
    include MemberContainer

    transform_currency = ->(v) {
      v.is_a?(Currency) ? v : Currency::EUR(v)
    }

    # @!attribute line_extension_amount
    #   @return [Xrechnung::CurrencyLong]
    member :line_extension_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # @!attribute tax_exclusive_amount
    #   @return [Xrechnung::CurrencyLong]
    member :tax_exclusive_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # @!attribute tax_inclusive_amount
    #   @return [Xrechnung::CurrencyLong]
    member :tax_inclusive_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # @!attribute allowance_total_amount
    #   @return [Xrechnung::CurrencyLong]
    member :allowance_total_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # @!attribute charge_total_amount
    #   @return [Xrechnung::CurrencyLong]
    member :charge_total_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # @!attribute prepaid_amount
    #   @return [Xrechnung::CurrencyLong]
    member :prepaid_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # @!attribute payable_rounding_amount
    #   @return [Xrechnung::CurrencyLong]
    member :payable_rounding_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # @!attribute payable_amount
    #   @return [Xrechnung::CurrencyLong]
    member :payable_amount, type: Xrechnung::CurrencyLong, transform_value: transform_currency

    # noinspection RubyResolve
    def to_xml(xml)
      self.class.members.each_key do |name|
        next if self[name].nil?

        xml.cbc :"#{name.to_s.split('_').map(&:capitalize).join}", *self[name].xml_args
      end
      xml.target!
    end
  end
end
