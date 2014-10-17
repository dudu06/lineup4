class SessionsController < ApplicationController
	
	def new 
		# @customer = Customer.new 
		@barber = Barber.new
	end 


	def create 
		@customer = Customer.where(email: params[:session][:email]).first
		#Let's find a user
		@barber = Barber.where(email: params[:session][:email]).first
		#if customer authenticates
		if @customer && @customer.authenticate(params[:session][:password])
			#This should set a cookie to the customer's browser
			session[:customer_id] = @customer.id.to_s
			redirect_to customer_path(@customer)
		elsif
			@barber && @barber.authenticate(params[:session][:password])
			session[:barber_id] = @barber.id.to_s
			redirect_to barber_path(@barber)
		else
			redirect_to root_path
		end
	end


	def destroy
	#kill our cookies
	reset_session
	redirect_to new_session_path
	end
	
end
