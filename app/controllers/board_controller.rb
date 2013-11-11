# encoding: utf-8

class BoardController < ApplicationController
  def initialize(*params)
    super(*params)
    @style='board'
    @script='board/index'
    @controller_name='게시판'
  end
end