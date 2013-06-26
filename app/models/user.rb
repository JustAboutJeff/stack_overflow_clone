class User < ActiveRecord::Base
   attr_accessible :real_name, :email, :password, :about, :age, :website, :location

   has_many :questions
   has_many :answers
   has_many :comments
   has_many :votes

   has_secure_password

end
