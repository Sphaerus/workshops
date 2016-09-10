require "spec_helper"

describe StudentsHelper do
  describe "#eight_y_ago" do
	subject { helper.eight_y_ago }
      
    it { is_expected.to eq Time.now.year - 8 }
  end

  describe "#ninety_y_ago" do
	subject { helper.ninety_y_ago }
      
    it { is_expected.to eq Time.now.year - 90 }
  end
end