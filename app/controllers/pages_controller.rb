class PagesController < ApplicationController
	def home
	end

	def index 
	end

	def welcome
		@customer = Customer.new
	end

	def show
		@barbers = Barber.all
	end 

end