# encoding: utf-8

class CustomerCenter::NoticesController < BoardController
  before_filter :authenticate_user!, :except => [:index,:show]

  def initialize
    super
    @meta_description='예쁘고 귀여운 수정이의 공지사항입니다.'    
    @style="board"
    @script="board"    
    @controller_name='공지사항'    
  end
  
  # GET /notices
  # GET /notices.json
  def index
    @notices = Notice.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notices }
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notice }
    end
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @notice = Notice.new
    @notice.build_notice_content
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notice }
    end
  end

  # GET /notices/1/edit
  def edit
    @notice = Notice.find(params[:id])
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(params[:notice])
    @notice.user_id=current_user.id

    respond_to do |format|
      if @notice.save
        format.html { redirect_to ['customer_center',@notice], notice: '공지사항이 작성되었습니다.' }
        format.json { render json: @notice, status: :created, location: @notice }
      else
        format.html { render action: "new" }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notices/1
  # PUT /notices/1.json
  def update
    @notice = Notice.find(params[:id])

    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        format.html { redirect_to ['customer_center',@notice], notice: '공지사항이 수정되었습니다.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to customer_center_notices_url }
      format.json { head :no_content }
    end
  end
end
