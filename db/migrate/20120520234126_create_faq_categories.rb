# encoding: utf-8

class CreateFaqCategories < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.string :title,:null=>false
      t.timestamps
    end
  end
end
