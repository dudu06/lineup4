class Portfoliobelongtobarber < ActiveRecord::Migration
  def change
  	add_reference :portfolios, :barber, index: true

  end
end
