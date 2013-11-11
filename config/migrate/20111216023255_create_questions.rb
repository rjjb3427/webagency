# encoding: utf-8

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user      
      t.string :title, :limit=>60, :null=>false
      t.string :name, :limit=>60
      t.string :encrypted_password,:limit=>40
      t.string :salt
      t.integer :secret, :default=>0, :null=>false
      t.integer :question_answers_count, :default=>0, :null=>false
      t.timestamps
    end
    
    create_table :question_contents do |t|
      t.text :content,:null=>false
    end
    
    create_table :question_answers do |t|
      t.references :question,:null=>false      
      t.references :user
      t.string :name
      t.string :encrypted_password,:limit=>40
      t.string :salt
      t.text :content,:null=>false
      t.timestamps
    end
    
    add_index :questions, :user_id        
    add_index :question_answers, :user_id     
    add_index :question_answers, :question_id 
  end  
end
