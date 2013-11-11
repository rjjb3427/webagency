# encoding: utf-8

class CustomerCenter::QuestionAnswersController < AnonCommentController
  def show   
    @question_answer = QuestionAnswer.find(params[:id])
    @parent=@question_answer.question
    return @question_answer
  end  
  
  def create
    @question = Question.find(params[:question_id])
    if(current_user)
      params[:question_answer][:user_id]=current_user.id
    end    
    @questionAnswer = @question.question_answer.create(params[:question_answer])
    redirect_to customer_center_question_path(@question)
  end
 
  def destroy
    @questionAnswer = QuestionAnswer.find(params[:id])
    @questionAnswer.destroy
    redirect_to customer_center_question_path(@questionAnswer.question)
  end
end
