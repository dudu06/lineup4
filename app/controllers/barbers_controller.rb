class BarbersController < ApplicationController

	def index
		@barbers = Barber.search(params[:search])
	end

	def new
		@barbers = Barber.new
	end

# SOCIALIZATION GEM METHOD
	def followers
    @barber = Barber.find(params[:id])
    @followers = @barber.followers(Barber)
    @barbers = Barber.all
   
    response = {:user => @user, :followers => @followers, :users => @users}

	    respond_to do |format|
	      format.html  #followers.html.erb
	      format.xml {render :xml => response}
	    end
    end

    def following
     @barber = Barber.find(params[:barber])
     @following = @barber.followers(Barber)
     @barbers = Barber.all

     response = {:barber => @barber, :following => @following, :barbers => @barbers}
	
     respond_to do |format|
      format.html  #following.html.erb
      format.xml {render :xml => response}
    end
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
		@portfolio = Portfolio.where(:barber_id => @barber.id).paginate(:per_page => 6, :page => params[:page])
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
		:low_price, :high_price, :bio, :avatar, :zipcode)
	end

end
