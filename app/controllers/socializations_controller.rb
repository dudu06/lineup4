class SocializationsController < ApplicationController
  before_filter :load_socializable
  # before_filter :load_portfolio

  # def load_portfolio
  #   @load_portfolio
  # end

  def follow
    if current_user
      @barber = Barber.find(params[:barber_id]) 
      @customer = Customer.find_by(params[:customer_id])  
      @barber.follow! current_user
      redirect_to barber_path(@barber)
    else 
      @barber = Barber.find(params[:barber_id])  
      @barber.follow! current_barber
      redirect_to barber_path(@barber)
    end
  end

  def unfollow
    if current_user 
      @barber = Barber.find(params[:barber_id]) 
      @customer = Customer.find_by(params[:customer_id]) 
      @barber.unfollow! current_user
      redirect_to barber_path(@barber)
    else 
      @barber = Barber.find(params[:barber_id])  
      @barber.unfollow! current_barber
      redirect_to barber_path(@barber)
    end
  end


  def like
  if current_user
    @barber = Barber.find(params[:barber_id])      
    @portfolio = Portfolio.find(params[:portfolio_id])
    # @customer = Customer.find_by(params[:customer_id])
    current_user.like! @portfolio
    # binding.pry
    redirect_to barber_portfolio_path(@barber, @portfolio)  
  else 
    @barber = Barber.find(params[:barber_id])         
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_barber.like! @portfolio
    redirect_to barber_portfolio_path(@barber, @portfolio)  
  end
end


def unlike   
  if current_user
    @barber = Barber.find(params[:barber_id])  
    @portfolio = Portfolio.find(params[:portfolio_id])
    # @customer = Customer.find_by(params[:customer_id])
    current_user.unlike! @portfolio
    redirect_to barber_portfolio_path(@barber, @portfolio)  
  else 
    @barber = Barber.find(params[:barber_id])         
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_barber.unlike! @portfolio
    redirect_to barber_portfolio_path(@barber, @portfolio)
end
  
end

  
  def load_socializable
    @socializable =
        case
      when id = params[:barber_id] # Must be before :item_id, since it's nested under it.
        Barber.find(params[:barber_id])
      when id = params[:customer_id]
        Customer.find(params[:customer_id])
      when id = params[:portfolio_id]
        Portfolio.find(params[:portfolio_id])
      else
        raise ArgumentError, "Unsupported socializable model, params: " +
                             params.keys.inspect
      end
    raise ActiveRecord::RecordNotFound unless @socializable
  end  

end
 

