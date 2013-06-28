class Vote < ActiveRecord::Base
 attr_accessible :user_id, :value, :voteable_type, :voteable_id
 validates_uniqueness_of :user_id, :scope => [:voteable_id, :voteable_type]
 belongs_to :voteable, :polymorphic => true

 def self.vote_score(element, votable_type)
 		p element.id
  	case votable_type
  	when "question"
  		Question.find(element.id).votes.sum('value')
		when "comment"
			Comment.find(element.id).votes.sum('value')
		when "answer"
			Answer.find(element.id).votes.sum('value')
		end
 	end
end
