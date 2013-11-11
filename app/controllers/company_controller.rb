# encoding: utf-8

class CompanyController < ApplicationController
  def initialize
    super
    @style='company'
    @script='index'
    @controller_name='회사소개'
  end

  def index
  
  end
end