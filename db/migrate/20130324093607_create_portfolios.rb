class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :company
      t.string :description  
      t.string :photo
      t.string :link   
      t.timestamps
    end
  end
end
