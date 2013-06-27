class User < ActiveRecord::Base
  require 'digest'

  # TODO: error handling
  # attr_reader :errors

  attr_accessible :real_name, :user_name, :email, :password, :about, :age,
                   :website, :location, :password_confirmation

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :user_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_secure_password
  before_save :create_gravatar_hash

  def self.validate(params={})
    return nil unless @user = User.find_by_email(params[:email])
    @user.authenticate(params[:password]) ? @user : nil
  end

  private

  def create_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end
end
