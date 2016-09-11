require "spec_helper"

describe PaymentsHelper do
  describe '#current_status' do 
    describe 'when student paid his current tuition' do 
      subject { helper.current_status(true) }

      it 'displays "PAID" string' do 
        is_expected.to eq 'PAID'
      end
    end

    describe 'when student didnt pay his current tuition' do 
      subject { helper.current_status(false) }

      it 'displays "NOT PAID" string' do 
        is_expected.to eq 'NOT PAID'
      end
    end
  end
end