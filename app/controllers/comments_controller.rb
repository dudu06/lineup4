class CommentsController < ApplicationController
  def new
  

  end

  def create
    # @comment = Comment.new(comment_params)
    @barber = Barber.find(params[:barber_id])
    @portfolio = Portfolio.find(params[:portfolio_id])
    @comment = @portfolio.comments.new(comment_params)

    @comment.barber = current_barber
    @comment.customer = @current_customer
    if @comment.save
    
      redirect_to barber_portfolio_path(@barber,@portfolio)

    else 
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
     redirect_to barber_portfolio_path(current_barber)
  end

  private

    def comment_params
    params.require(:comment).permit(:content, :customername, :barbername)
  end

end


@follow = @barber.follows.new(follower_params)



def follower_params
  params.require(:follow).permit(:)




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

  def upvote
    @portfolio = Portfolio.find(params[:id])
    current_user.create_activity(@portfolio, 'liked')
    current_barber.create_activity(@portfolio, 'liked')
    @portfolio.liked_by current_user
    @portfolio.liked_by current_barber
    # redirect_to :back
    respond_to do |format|
      format.html {redirect_to portfolios_path }
      format.json { render json: @status, include: [:get_upvotes, :portfolios] }
    end
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
