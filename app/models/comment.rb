class Comment < ActiveRecord::Base
 attr_accessible :user_id, :content, :commentable_type, :commentable_id
 
 belongs_to :commentable, :polymorphic => true
 belongs_to :user
 has_many :votes, :as => :voteable
end
