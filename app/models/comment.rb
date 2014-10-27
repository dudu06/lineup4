class Comment < ActiveRecord::Base
	belongs_to :barber
	belongs_to :customer
	belongs_to :portfolio

end
