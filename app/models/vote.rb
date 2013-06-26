class Vote < ActiveRecord::Base
 attr_accessible :user_id, :value, :voteable_type, :voteable_id
 
 belongs_to :voteable, :polymorphic => true

end
