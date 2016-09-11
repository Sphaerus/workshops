class PaymentsController < ApplicationController
	before_filter :authenticate_user!
	expose(:students)

	def index
	end
end