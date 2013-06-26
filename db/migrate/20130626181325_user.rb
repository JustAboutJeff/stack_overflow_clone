class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :real_name
      t.string  :gravatar_url
      t.string  :email
      t.string  :user_name
      t.string  :password_digest
      t.text    :about
      t.integer :age
      t.string  :website
      t.string  :location

      t.timestamps
    end
  end

end
