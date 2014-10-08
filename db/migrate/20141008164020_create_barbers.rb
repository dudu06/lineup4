class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
      t.string :email
      t.string :name
      t.string :bio
      t.string :zipcode
      t.float :low_price
      t.float :high_price
      t.string :password_digest

      t.timestamps
    end
  end
end
