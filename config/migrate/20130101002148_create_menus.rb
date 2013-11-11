# encoding: utf-8

class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title,:limit=>60, :null=>false
      t.string :path,:limit=>60, :null=>false
      t.string :photo, :null=>false
      t.string :alt, :limit=>60
      t.boolean :enable, :default=>1 
      t.timestamps
    end
  end
end
