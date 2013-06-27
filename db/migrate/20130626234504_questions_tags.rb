class QuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags do |q|
      q.integer  	:question_id
      q.integer 	:tag_id

      q.timestamps
    end
  end
end
