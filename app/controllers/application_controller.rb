# encoding: utf-8

class ApplicationController < ActionController::Base  
  protect_from_forgery with: :exception
  layout :layout
  before_filter :set_locale
  
  def initialize(*params)
    super(*params)
    @title='살인자 은행이 망하는 그날까지!!'
    @meta_robot='all, index, follow'
    @meta_application_name='anti-kb 홈페이지'
    @meta_description='anti-kb 홈페이지입니다.'
    @meta_keyword='kb,KB,국민은행,금융,은행,대출,신용,신용대출,담보,사채,카드,카드론,이자,안티,급전,anti,살인자은행,antikb,이승기,김연아'
    
    @footer_address='서울시 노원구'
    @footer_description='이 사이트를 무단으로 복제,전제하는 것은 법적인 처벌을 받지 않습니다.'    
    
    @style='application'
    @script='index'
  end
  
  def set_locale
     I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def layout
    if(params[:no_layout])
      return nil
    else
      return 'application'
    end
  end  
end
