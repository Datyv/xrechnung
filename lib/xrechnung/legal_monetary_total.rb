module Xrechnung
  class LegalMonetaryTotal
    include MemberContainer

    transform_currency = ->(v) {
      CurrencyLong::EUR(v)
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
      members.each do |member, _options|
        next if self[member].nil?

        xml.cbc :"#{member.to_s.split("_").map(&:capitalize).join}", *self[member].xml_args
      end
      xml.target!
    end
  end
end
