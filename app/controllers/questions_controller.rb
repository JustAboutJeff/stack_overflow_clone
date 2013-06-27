class QuestionsController < ApplicationController
	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
		@tag = Tag.new
	end

	def create
		question = Question.create(params[:question])
		all_tags = params[:tags].split(',')
		all_tags.each do |tag|
			question.tags << Tag.find_or_create_by_tag_name(
																											:tag_name => tag.strip,
																											:question_id => question.id	
																											)
		end
		current_user.questions << question
		redirect_to questions_path
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