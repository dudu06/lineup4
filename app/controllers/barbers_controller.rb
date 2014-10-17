class BarbersController < ApplicationController

	def index
		@barbers = Barber.all 
	end

	def new
		@barbers = Barber.new
	end

	def create 
		@barber = Barber.new(barber_params)
		if @barber.save
			session[:barber_id] = @barber_id.to_s
			redirect_to new_session_path
		else
			render 'new'
		end
	end

	def show
		@barber = Barber.find(params[:id])
		@portfolio = Portfolio.where(:barber_id => @barber.id)
		
	end

	def edit
		@barber = Barber.find(params[:id])
	end

	def update
		@barber = Barber.find(params[:id])
		if @barber.update_attributes(barber_params)
	  	redirect_to barber_path
		else
	    render 'edit'
		end
	end

	def barber_params
		params.require(:barber).permit(:name, 
		:email, :password, :password_confirmation, 
		:low_price, :high_price, :bio, :avatar)
	end

end
