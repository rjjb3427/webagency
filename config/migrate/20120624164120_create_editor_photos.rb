# encoding: utf-8

class CreateEditorPhotos < ActiveRecord::Migration
  def change
    create_table :editor_photos do |t|
      t.string :photo,:null=>false
      t.timestamps
    end
  end
end
