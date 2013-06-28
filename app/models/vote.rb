class Vote < ActiveRecord::Base
 attr_accessible :user_id, :value, :voteable_type, :voteable_id
 validates_uniqueness_of :user_id, scope: [:voteable_id]
 
 belongs_to :voteable, :polymorphic => true

end
