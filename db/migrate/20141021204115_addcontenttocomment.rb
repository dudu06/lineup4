class Addcontenttocomment < ActiveRecord::Migration
  def change
  	add_column :comments, :content, :string
  	add_reference :comments, :portfolio, index: true
  	add_reference :comments, :barber, index: true
  	add_reference :comments, :customer, index: true
  end
end
