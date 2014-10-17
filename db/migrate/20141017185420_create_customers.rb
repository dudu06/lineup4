class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :name
      t.string :bio
      t.string :zipcode
      t.string :password_digest

      t.timestamps
    end
  end
end
