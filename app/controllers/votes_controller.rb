class VotesController < ApplicationController
	def create
		case params[:votable_element]
		when 'question'
			votable_element = Question.find(params[:element_id])
		when 'comment'
			votable_element = Comment.find(params[:element_id])
		when 'answer'
			votable_element = Answer.find(params[:element_id])
		end
		votable_element.votes << Vote.create(
																				:value => params[:value],
																				:user_id => current_user.id
																				)
		redirect_to root_path
	end
end