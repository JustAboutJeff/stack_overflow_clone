class CommentsController < ApplicationController
  
  def create
    klass = params[:question_id] ? "Question" : "Answer"

    comment = Comment.new(params[:comment])
    commentable = Question.find(params[:question_id]) if klass == "Question"
    commentable = Answer.find(params[:answer_id]) if klass == "Answer"

    commentable.comments << comment

    if !comment.save
      @errors = "Comment did not save"
    end
    redirect_to(:back)
  end

  def edit
    session[:return_to] ||= request.referer
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(params[:comment])
    if !comment.save
      @errors = "Update did not save"
    end
    redirect_to session[:return_to]
  end

  def destroy
    session[:return_to] ||= request.referer
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to session[:return_to]
  end

end
