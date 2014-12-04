class CustomersController < ApplicationController


  def index
    @barbers = Customer.all 
  end

  def new
    @customers = Customer.new
  end

  def create 
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer_id.to_s
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def show
    @customer = Customer.find(params[:id])
    # binding.pry
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      redirect_to customer_path
    else
      render 'edit'
    end
  end

  def followers
    @customer = Customer.find(params[:id])
  end 

  def following
    @customer = Customer.find(params[:id])
  end

  def customer_params
      params.require(:customer).permit(:name, 
    :email, :password, :password_confirmation, 
    :low_price, :high_price, :bio, :avatar)
  end

end
