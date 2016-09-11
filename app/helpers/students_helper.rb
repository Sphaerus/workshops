module StudentsHelper
	def ninety_y_ago 
		Time.now.year - 90
	end

	def eight_y_ago
		Time.now.year - 8
	end

	def sorted_payments(payments)
		return payments.sort_by { |payment| payment.payment_date }
	end
end