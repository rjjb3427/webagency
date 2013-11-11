class CreateTemplateSources < ActiveRecord::Migration
  def change
    create_table :template_sources do |t|
      t.string :name, :null=>false, :limit=>60
      t.string :korean_name, :limit=>60      
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end
