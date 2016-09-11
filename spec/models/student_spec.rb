require 'rails_helper'

RSpec.describe Student do
  let!(:student) { create :student, first_name: 'Bruce', last_name: 'Wayne' }
  let!(:student2) { create :student, first_name: 'Peter', last_name: 'Parker' }
  let!(:payment) { create :payment, student: student, payment_date: Date.new(2016,9,1) }
  let!(:payment2) { create :payment, student: student, payment_date: Date.new(2016,8,1) }
  let!(:payment3) { create :payment, student: student, payment_date: Date.new(2015,7,1) }

  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe 'database columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
    it { should have_db_column :birthday }
  end

  describe 'associations' do
    it { is_expected.to have_many :subject_items }
    it { is_expected.to have_many :subject_item_notes }
    it { is_expected.to have_many :participations }
    it { is_expected.to have_many :payments }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for :subject_items }
    it { should accept_nested_attributes_for :payments }
  end

  describe '#paid_this_month?' do 
    describe 'when student has his tuition paid' do
      subject { student.paid_this_month? }

      it { is_expected.to eq true}
    end

    describe 'when student doesnt have his tuition paid' do 
      subject { student2.paid_this_month? }

      it { is_expected.to eq false}
    end
  end

  describe '#payments_by_year' do
    subject { student.payments_by_year }
    it 'returns hash of payments with years as keys' do
      expected = { 2016 => [payment, payment2], 2015 => [payment3] }

      is_expected.to eq expected
    end
  end
end
