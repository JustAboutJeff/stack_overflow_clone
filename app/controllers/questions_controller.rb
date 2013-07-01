class QuestionsController < ApplicationController
	def index
		@questions = Question.order("created_at DESC")
	end

	def new
		if !current_user
			redirect_to root_path
		else
			@question = Question.new
			@tag = Tag.new
		end
	end

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new
		@comment = Comment.new
	end

	def create
		question = Question.create(params[:question])
		all_tags = params[:tags].split(',')
		all_tags.each do |tag|
			question.tags << Tag.find_or_create_by_tag_name(:tag_name => tag.strip)
		end
		current_user.questions << question
		redirect_to questions_path
	end

	def edit
		@question = Question.find(params[:id])
		if !current_user.id == @question.user.id
			redirect_to root_path
		end
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
