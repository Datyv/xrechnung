load("spec/fixtures/ruby/tax_category.rb")

def build_tax_subtotal
  Xrechnung::TaxSubtotal.new(
    taxable_amount: Xrechnung::CurrencyLong::EUR(1294.30),
    tax_amount:     Xrechnung::CurrencyLong::EUR(207.09),
    tax_category:   build_tax_category,
  )
end
