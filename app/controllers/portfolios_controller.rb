class PortfoliosController < ApplicationController
  
  def index
    @portfolios = Barber.all 
  end

  def new
    @portfolio = Portfolio.new
    @barber = Barber.find(params[:barber_id])
  end

  def create 
    @barber = Barber.find(params[:barber_id])
    @portfolio = @barber.portfolios.new(portfolio_params)
    @portfolio.barber = current_barber
    if @portfolio.save
      
      redirect_to barber_path(@barber)
    else
      render 'new'
    end
  end

  def show
    @barber = Barber.find(params[:barber_id])
    @portfolio = Portfolio.find(params[:id])
    @comment = Comment.new   
  end

  def edit
     @portfolio = Portfolio.find(params[:id])
     @barber = Barber.find(params[:barber_id])
  end



  def update
   @portfolio = Portfolio.find(params[:id])
    if @portfolio.update_attributes(portfolio_params)
      redirect_to barber_path(current_barber)
      # redirect as the (current_barber). If we don't put that, it finds the picture without finding the user
    else
      render 'edit'
    end
  end

  def destroy
   @portfolio = Portfolio.find(params[:id])
   @portfolio.destroy
   redirect_to barber_path(current_barber)
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, 
    :description, :photo, :barber_id)
  end

end

