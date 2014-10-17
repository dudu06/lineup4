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
    @portfolio = Portfolio.new
    
  end

  def edit
   # @barber = Barber.find(params[:id])
  end

  def update
    # @barber = Barber.find(params[:id])
    # if @barber.update_attributes(barber_params)
    #   redirect_to barber_path
    # else
    #   render 'edit'
    # end
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, 
    :description, :photo, :barber_id)
  end

end
