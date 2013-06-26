class Tag < ActiveRecord::Base
  attr_accessible :tag_name, :question_id
  
  belongs_to :question

end
