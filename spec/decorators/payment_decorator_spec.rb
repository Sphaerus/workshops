require 'rails_helper'

describe PaymentDecorator do
  let(:payment) { build :payment, payment_date: Date.new(2016,1,1) }

  describe "#month" do
    subject { payment.decorate.month }
    it { is_expected.to eq 'January' }
  end
end
