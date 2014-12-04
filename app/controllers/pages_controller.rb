class PagesController < ApplicationController
	def home
	end

	# def index 
	# 	if current_user
	# 	@customer = Customer.find(params[:customer_id])
	# 	current_user.followables(current_user || current_barber)
	# 	else 
	# 	@barber = Barber.find(params[:barber_id])
	# 	@barber.followables(current_barber)
	# end
	# end

	def welcome
		@customer = Customer.new
	end

	def show
		@barbers = Barber.all
	end 

end