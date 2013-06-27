class CommentsController < ApplicationController
  
  # def index
  #   @comments = Comment.order("created_at DESC")
  # end

  # def show
  #   @comment = Commment.find(params[:id])
  # end

  def create
    comment = Comment.new(params[:comment])
    commentable = Answer.find(params[:answer_id])
    commentable.comments << comment

    if comment.save
      redirect_to answer_path(commentable)
    else
      # @errors = #.errors
      redirect_to answer_path(commentable) 
    end
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # def update
  #   comment = Comment.find(params[:id])
  #   comment.update_attributes(params[:comment])
  #   if comment.save
  #     redirect_to #
  #   else
  #     redirect_to #
  #   end
  # end

  # def destroy
  #   comments = Answer.find(params[:id])
  #   comment.destroy
  #   redirect_to #
  # end

end
