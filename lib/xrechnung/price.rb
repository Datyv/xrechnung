module Xrechnung
  class Price
    include MemberContainer

    # @!attribute price_amount
    #   @return [Xrechnung::CurrencyLong]
    member :price_amount, type: Xrechnung::CurrencyLong

    # @!attribute base_quantity
    #   @return [Xrechnung::Quantity]
    member :base_quantity, type: Xrechnung::Quantity

    # @!attribute allowance_charge
    #   @return [Xrechnung::AllowanceCharge]
    member :allowance_charge, type: Xrechnung::AllowanceCharge

    def initialize(**kwargs)
      kwargs[:price_amount] = Currency::EUR(kwargs[:price_amount]) unless kwargs[:price_amount].is_a?(Currency)
      super(**kwargs)
    end

    # noinspection RubyResolve
    def to_xml(xml)
      xml.cac :Price do
        xml.cbc :PriceAmount, *price_amount.xml_args
        xml.cbc(:BaseQuantity, *base_quantity.xml_args) unless base_quantity.nil?
        allowance_charge&.to_xml(xml)
      end
    end
  end
end
