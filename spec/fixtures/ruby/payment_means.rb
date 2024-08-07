load("spec/fixtures/ruby/payee_financial_account.rb")

def build_payment_means
  Xrechnung::PaymentMeans.new(
    payment_means_code:      30,
    payee_financial_account: build_payee_financial_account,
  )
end
