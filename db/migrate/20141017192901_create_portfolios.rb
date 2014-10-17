class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
