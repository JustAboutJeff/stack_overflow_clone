class QuestionsController < ApplicationController
	
	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		question = Question.new(params[:question])
		current_user.questions << question
		if question.save
			redirect_to questions_path
		else
			@errors = "Could not create Question"
			erb new
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		question = Question.find(params[:id])
		question.update_attributes(params[:question])
		if question.save
			redirect_to questions_path
		else
			redirect_to questions_path
		end
	end

	def destroy
		question = Question.find(params[:id])
		question.destroy
		redirect_to questions_path
	end

end