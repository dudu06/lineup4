module ApplicationHelper

  def get_likes(object)
    object.likers(Customer).count + object.likers(Barber).count
  end

end
