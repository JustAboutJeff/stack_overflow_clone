class Question < ActiveRecord::Base
  attr_accessible :title, :content, :user_id

  belongs_to :user
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  
  has_many :questions_tags
  has_many :tags, :through => :questions_tags

  def vote_score
 		self.votes.sum('value')
 	end
end
