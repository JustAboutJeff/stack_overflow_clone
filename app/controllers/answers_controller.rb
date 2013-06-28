class AnswersController < ApplicationController
  def index
    @answers = Answer.order("created_at DESC")
  end

  def show
    @answer = Answer.find(params[:id])
    @comment = Comment.new
  end

  def create
    answer = Answer.new(params[:answer])
    question = Question.find(params[:question_id])
    question.answers << answer
    answer.user_id = current_user.id
    if answer.save
      redirect_to question_path(question.id)
    else
      @errors = answer.errors
      redirect_to question_path(question.id)
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    answer = Answer.find(params[:id])
    answer.update_attributes(params[:answer])
    if answer.save
      redirect_to questions_path
    else
      redirect_to questions_path
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to questions_path
  end
end
