class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :real_name, :user_name, :email, :password, :about, :age,
                   :website, :location, :password_confirmation

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  before_save :create_gravatar_hash

  has_secure_password

  def create_gravatar_hash
    self.gravatar_url = Digest::MD5.hexdigest( self.email.strip.downcase )
  end
end
