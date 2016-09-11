module PaymentsHelper
	def current_status(paid)
		paid ? "PAID" : "NOT PAID"
	end
end