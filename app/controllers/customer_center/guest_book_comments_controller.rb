# encoding: utf-8

class CustomerCenter::GuestBookCommentsController < AnonCommentController
  def show   
    @guest_book_comment = GuestBookComment.find(params[:id])
    @parent=@guest_book_comment.guest_book
    return @guest_book_comment
  end
  
  def edit
    @guest_book = GuestBook.find(params[:guest_book_id])
    @guest_book_comments=@guest_book.guest_book_comment.order('id desc').page(params[:page]).per(10)    
  end
  
  def create
    @guest_book = GuestBook.find(params[:guest_book_id])
    if(current_user)
      params[:guest_book_comment][:user_id]=current_user.id
    end
    @guest_book_comment = @guest_book.guest_book_comment.create(params[:guest_book_comment])
    redirect_to customer_center_guest_book_path(@guest_book)
  end
 
  def destroy
    @guest_book_comment = GuestBookComment.find(params[:id])
    @guest_book_comment.destroy
    
    redirect_to customer_center_guest_book_path(@guest_book_comment.guest_book)
  end
end
