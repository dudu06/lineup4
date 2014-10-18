class Barber < ActiveRecord::Base
	has_secure_password 
	has_many :portfolios
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  	def self.search(search)
  	if search
  		

    	where('zipcode ILIKE ? OR name ILIKE ?', "%#{search}%", "%#{search}%")
    
    	
    	
  	else
    	scoped 
 	 end
	end
end
