class Addusernametocomments < ActiveRecord::Migration
  def change
  	add_column :comments, :customername, :string
  	add_column :comments, :barbername, :string
  end
end
