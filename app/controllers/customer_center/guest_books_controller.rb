# encoding: utf-8

class CustomerCenter::GuestBooksController < AnonBoardController
  
  def initialize(*params)
    super(*params)
    @controller_name='상담'
  end
  
  # GET /guest_books
  # GET /guest_books.json
  def index
    @guest_books = GuestBook.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @guest_books }
    end
  end
  
  # GET /guest_books/1
  # GET /guest_books/1.json
  def show
    @guest_book = GuestBook.find(params[:id])
    @guest_book_comments=@guest_book.guest_book_comment.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @guest_book }
    end
  end
  
  # GET /guest_books/new
  # GET /guest_books/new.json
  def new
    @guest_book = GuestBook.new
    @guest_book.build_guest_book_content
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @guest_book }
    end
  end
  
  # GET /guest_books/1/edit
  def edit
    @guest_book = GuestBook.find(params[:id])
  end
  
  # POST /guest_books
  # POST /guest_books.json
  def create
    @guest_book = GuestBook.new(params[:guest_book])
    
    if current_user
      @guest_book.user_id=current_user.id
    end
    
    respond_to do |format|
      if @guest_book.save
        format.html { redirect_to ['customer_center',@guest_book], :notice => '방명록이 작성되었습니다.' }
        format.json { render :json => @guest_book, :status => :created, :location => @guest_book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @guest_book.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /guest_books/1
  # PUT /guest_books/1.json
  def update
    @guest_book = GuestBook.find(params[:id])
    
    respond_to do |format|
      if @guest_book.update_attributes(params[:guest_book])
        format.html { redirect_to ['customer_center',@guest_book], :notice => '방명록이 수정되었습니다.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @guest_book.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /guest_books/1
  # DELETE /guest_books/1.json
  def destroy
    @guest_book = GuestBook.find(params[:id])
    @guest_book.destroy
    
    respond_to do |format|
      format.html { redirect_to customer_center_guest_books_url }
      format.json { head :ok }
    end
  end
end
