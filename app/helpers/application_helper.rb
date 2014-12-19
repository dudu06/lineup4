module ApplicationHelper

  def whos_signed_in?(user)
    user = user === nil ? 'barber' : 'customer'
    case user
    when 'barber'
      'barber logged in'
    when 'customer'
      'customer is logged in'
    end
  end

  def get_barber_followers(object)
    Follow.all.where("follower_type = ? AND follower_id = ?", "Barber", "#{object.id}")
  end

  def get_barber_following(object)
    Follow.all.where("followable_type = ? AND followable_id = ?", "Barber", "#{object.id}")
  end

  def get_customer_followers(object)
    Follow.all.where("follower_type = ? AND follower_id = ?", "Customer", "#{object.id}")
  end

  def get_customer_following(object)
    Follow.all.where("followable_type = ? AND followable_id = ?", "Customer", "#{object.id}")
  end

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



