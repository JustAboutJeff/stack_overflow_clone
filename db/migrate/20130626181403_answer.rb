class Answer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text    :content
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
