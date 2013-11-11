
class CreateMaintains < ActiveRecord::Migration
  def change
    create_table :maintains do |t|
      t.string :title, :null=>false, :limit=>60
      t.string :photo
      t.timestamps
    end
    
    create_table :maintain_contents do |t|
      t.text :content,:null=>false
    end    
  end
end
