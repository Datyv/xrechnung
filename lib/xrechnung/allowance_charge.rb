module Xrechnung
  class AllowanceCharge
    include MemberContainer

    # @!attribute charge_indicator
    #   @return [TrueClass, FalseClass]
    member :charge_indicator, type: [TrueClass, FalseClass]

    # @!attribute amount
    #   @return [Xrechnung::CurrencyLong]
    member :amount, type: Xrechnung::CurrencyLong

    # @!attribute base_amount
    #   @return [Xrechnung::CurrencyLong]
    member :base_amount, type: Xrechnung::CurrencyLong

    def initialize(**kwargs)
      kwargs[:amount]      = CurrencyLong::EUR(kwargs[:amount])
      kwargs[:base_amount] = CurrencyLong::EUR(kwargs[:base_amount])
      super(**kwargs)
    end

    # noinspection RubyResolve
    def to_xml(xml)
      xml.cac :AllowanceCharge do
        xml.cbc :ChargeIndicator, charge_indicator
        xml.cbc :Amount, *amount.xml_args
        xml.cbc :BaseAmount, *base_amount.xml_args
      end
    end
  end
end
