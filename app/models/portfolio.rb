# encoding: utf-8

require 'carrierwave/orm/activerecord'

class Portfolio < ActiveRecord::Base
  attr_accessible :title, :link, :company, :description, :photo
  validates_presence_of :title, :link, :company, :description, :photo
  mount_uploader :photo, PortfolioUploader
end
