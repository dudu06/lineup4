class SocializationsController < ApplicationController
  before_filter :load_socializable

  def follow
    if current_user 
      current_user.follow!(@socializable) 
      render json: { follow: true }
    else 
      current_barber.follow!(@socializable)
      # render barber_path(@barber)
      redirect_to follow_barber_path(current_barber)
      render json: { follow: true}
    end
  end

  def unfollow
    if current_user 
      current_user.unfollow!(@socializable)
      render json: { follow: false }
    else 
      current_barber.unfollow!(@socializable)
      redirect_to unfollow_barber_path(current_barber)
      render json: { follow: false}
    end
  end

  def like
  if current_user 
    current_user.like! @portfolio
    render json: { like: true }
  else 
    current_barber.like!(@portfolio)
    render json: { like: true }
  end
end

def unlike   
  if current_user 
    current_user.unlike!(@socializable) 
    render json: { unlike: false }
  else 
    current_barber.unlike!(@socializable)
    render json: { unlike: false }
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
 

