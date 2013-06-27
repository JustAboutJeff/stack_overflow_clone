class Tag < ActiveRecord::Base
  attr_accessible :tag_name, :question_id
  
  has_many :questions_tags
  has_many :questions, :through => :questions_tags

end

