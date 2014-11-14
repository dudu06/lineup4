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
