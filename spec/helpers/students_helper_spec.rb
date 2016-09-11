require "spec_helper"

describe StudentsHelper do
  describe '#eight_y_ago' do
	subject { helper.eight_y_ago }
      
    it { is_expected.to eq Time.now.year - 8 }
  end

  describe '#ninety_y_ago' do
	subject { helper.ninety_y_ago }
      
    it { is_expected.to eq Time.now.year - 90 }
  end
  let(:student) { create :student, first_name: "Bill", last_name: "Gates"}
  let(:payment1) { create :payment, payment_date: Date.new(2016, 1, 2), student: student }
  let(:payment2) { create :payment, payment_date: Date.new(2014, 1, 2), student: student }
  let(:payment3) { create :payment, payment_date: Date.new(2013, 4, 2), student: student }

  describe '#sorted_payments' do
  	it 'for list of payments' do 
		payments = [payment1, payment2, payment3]
		expected = payments.sort_by { |payment| payment.payment_date }.reverse

		expect(helper.sorted_payments(payments)).to eq expected
	end  	
  end
end