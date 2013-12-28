# encoding: utf-8

class CustomerCenter::FaqCategory < ActiveRecord::Base
  validates_presence_of :title
  has_many :faq
end
