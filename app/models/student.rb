class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations
  has_many :payments

  accepts_nested_attributes_for :subject_items, :payments

  validates :first_name, :last_name, presence: true

  def paid_this_month?
  	payments.any? { |payment| payment.payment_date.month == Time.now.month && payment.payment_date.year == Time.now.year }
  end
end
