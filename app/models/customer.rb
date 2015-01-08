class Customer < ActiveRecord::Base
	acts_as_followable
    acts_as_follower
    acts_as_liker
    # acts_as_voter
	has_secure_password 
	has_many :comments
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/thumb/missing.png", :storage =>   
:s3, :bucket => "<lineupbucket>"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def pretty
    name.titleize
  end

end


 # has_many :active_relationships, class_name:  "Relationship",
 #                                  foreign_key: "follower_id",
 #                                  dependent:   :destroy

