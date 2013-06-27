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

    redirect_to answer_path(commentable) if klass == "Answer"
    redirect_to question_path(commentable) if klass == "Question"
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  # def update
  #   comment = Comment.find(params[:id])
  #   comment.update_attributes(params[:comment])
  #   if comment.save
  #     redirect_to #
  #   else
  #     redirect_to #
  #   end
  # end

  def destroy
    comments = Answer.find(params[:id])
    comment.destroy
    redirect_to root_path
  end

end
