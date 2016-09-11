class PaymentDecorator < BaseDecorator
  def month
    payment_date.strftime("%B")
  end
end
