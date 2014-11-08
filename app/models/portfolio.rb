class Portfolio < ActiveRecord::Base
	# acts_as_votable
	belongs_to :barber
	has_many :comments
	acts_as_likeable
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
