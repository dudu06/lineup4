class Barber < ActiveRecord::Base
	has_secure_password 
  acts_as_followable
  acts_as_follower
  acts_as_liker
  # acts_as_voter
  has_many :comments
	has_many :portfolios
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :storage =>   
:s3, :bucket => "lineupnewbucket"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  	def self.search(search)
  	if search
  		

    	where('zipcode ILIKE ? OR name ILIKE ?', "%#{search}%", "%#{search}%")
    
    	
    	
  	else
    	scoped 
 	 end
	end
end
