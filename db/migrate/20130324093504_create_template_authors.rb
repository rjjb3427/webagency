class CreateTemplateAuthors < ActiveRecord::Migration
  def change
    create_table :template_authors do |t|
      t.string :name, :null=>false
      t.string :korean_name, :limit=>60      
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end
