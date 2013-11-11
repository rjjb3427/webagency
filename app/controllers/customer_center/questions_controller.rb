# encoding: utf-8

class CustomerCenter::QuestionsController < AnonBoardController
  impressionist :actions=>[:show]
  before_filter :check_secret, :only => [:show]
  
  def initialize(*params)
    super(*params)
    @meta_description='질문,답변 게시판입니다.'    
    @controller_name='질문,답변'
  end  
  
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @questions }
    end
  end
  
  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @question_answer=@question.question_answer.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @question }
    end
  end
  
  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    @question.build_question_content
    @script="board/new"
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @question }
    end
  end
  
  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end
  
  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    
    if current_user
      @question.user_id=current_user.id
    end 
    
    respond_to do |format|
      if @question.save
        session[@question.class.name]||={} 
        session[@question.class.name][:guest_pass_id]||=[]
        session[@question.class.name][:guest_pass_id]<<@question.id
        format.html { redirect_to ['customer_center',@question], :notice => '질문이 작성되었습니다.' }
        format.json { render :json => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to ['customer_center',@question], :notice => '질문이 수정되었습니다.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    
    respond_to do |format|
      format.html { redirect_to customer_center_questions_url }
      format.json { head :ok }
    end
  end
  
  def read_password_fail
    
  end
  
  def read_password
    self._read_password
  end
  
  def read_privileges?
    self._read_privileges
  end
  
  protected
  
  def _read_privileges
    gg=self.edit
    @gname=gg.class.name 
    @gid=gg.id
    
    unless gg.secret?
      return true
    end
    
    if(gg.user_id)
      if(current_user)
        if(current_user.id===gg.user_id)
          return true
        else
          return false
        end
      else
        return false
      end
    end
    
    unless session.key?(@gname)
      return false
    else
      if session[@gname][:guest_pass_id]
        unless session[@gname][:guest_pass_id].include?(@gid)
          return false
        end
      else
        return false
      end
    end
    
    return true
  end
  
  def _read_password
    gg=self.edit
    @gid=gg.id
    @gname=gg.class.name
    
    session[@gname]||={}    
    session[@gname][:guest_pass_id]||=[]
    
    if session[@gname][:guest_pass_fail]
      if session[@gname][:guest_pass_fail].key?(@gid)
        if session[@gname][:guest_pass_fail][@gid].to_i>3
          render(:action=>'read_password_fail',:id=>@gid)
        end
      else
        session[@gname][:guest_pass_fail][@gid]=0
      end
    else
      session[@gname][:guest_pass_fail]={}
      session[@gname][:guest_pass_fail][@gid]=0
    end
    
    if(params[:password])
      if params[:password]==gg.password
        session[@gname][:guest_pass_id]<<@gid
        redirect_to(:action=>'show',:id=>@gid)
      else
        session[@gname][:guest_pass_fail][@gid]=session[@gname][:guest_pass_fail][@gid].to_i+1
        flash.now[:notice]='비밀번호가 일치하지 않습니다.'
      end
    else
      flash.now[:notice]='비밀번호를 입력해주세요.'
    end
  end
  
  def check_secret
    if self.read_privileges?
      return true
    end
    
    redirect_to(:action=>'read_password',:id=>@gid)
  end
end
