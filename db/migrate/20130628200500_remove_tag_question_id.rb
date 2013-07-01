class RemoveTagQuestionId < ActiveRecord::Migration
  def up
    remove_column :tags, :question_id
  end

  def down
    add_column :tags, :question_id, :integer
  end
end
