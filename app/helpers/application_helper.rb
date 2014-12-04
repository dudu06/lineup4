module ApplicationHelper

  def get_likes(object)
    object.likers(Customer).count + object.likers(Barber).count
  end

  def get_follows(object)
  	object.followers(Customer).count + object.followers(Barber).count
  end

  def get_fans(object)
  	object.followables(Customer).count + object.followables(Barber).count
  end

end
