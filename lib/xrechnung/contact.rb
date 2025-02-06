module Xrechnung
  class Contact
    include MemberContainer

    # @!attribute name
    #   @return [String]
    member :name, type: String

    # @!attribute telephone
    #   @return [String]
    member :telephone, type: String, optional: true

    # @!attribute electronic_mail
    #   @return [String]
    member :electronic_mail, type: String, optional: true

    # noinspection RubyResolve
    def to_xml(xml)
      xml.cac :Contact do
        xml.cbc :Name, name
        xml.cbc :Telephone, telephone if telephone.present?
        xml.cbc :ElectronicMail, electronic_mail if electronic_mail.present?
      end
    end
  end
end
