require 'rails_helper'

describe StudentDecorator do
  let(:teacher) { create :teacher, first_name: 'John', last_name: 'Smith' }
  let(:student) { create :student, first_name: 'John', last_name: 'Smith', birthday: Date.new(2016,11,9)}
  let(:student2) { create :student, first_name: 'John', last_name: 'Smith' }
  let(:subject_item) { create :subject_item, teacher: teacher }
  let(:second_subject_item) { create :subject_item }
  let!(:note_1) { create :subject_item_note, value: 5, student: student, subject_item: second_subject_item }
  let!(:note_2) { create :subject_item_note, value: 4, student: student, subject_item: second_subject_item }
  let!(:payment) { create :payment, student: student, payment_date: Date.new(2016,9,1) }
  let!(:payment2) { create :payment, student: student, payment_date: Date.new(2016,8,1) }
  let!(:payment3) { create :payment, student: student, payment_date: Date.new(2016,7,1) }

  describe "#full_name" do
    subject { student.decorate.full_name }
    it { is_expected.to eq 'John Smith' }
  end

  describe "#avg_notes" do
    describe "when student doesn't have notes assigned" do
      subject { student.decorate.avg_notes(subject_item) }

      it "returns 0.00" do
        is_expected.to eq '0.00'
      end
    end

    describe 'when student has notes assigned' do
      subject { student.decorate.avg_notes(second_subject_item) }

      it 'calculates avg of student notes' do
        is_expected.to eq '4.50'
      end
    end
  end

  describe '#formatted_birthday' do
    describe 'when student has no birthday filled in' do
      subject { student2.decorate.formatted_birthday }

      it 'displays empty string' do
        is_expected.to eq ''
      end
    end

    describe 'when student has birthday filled in' do    
      subject { student.decorate.formatted_birthday }
      
      it 'displays string with formatted date of birth' do 
        is_expected.to eq '2016-11_09'
      end
    end  
  end
end
