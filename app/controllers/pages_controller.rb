class PagesController < ApplicationController
	def home
	end

	def welcome
		@customer = Customer.new
	end

end