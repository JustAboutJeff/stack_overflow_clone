class Comment < ActiveRecord::Base
 attr_accessible :user_id, :content, :commentable_type, :commentable_id
 
 belongs_to :commentable, :polymorphic => true

end
