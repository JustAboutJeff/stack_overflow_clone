require 'spec_helper'

describe Comment do
  let(:user) { User.new(user_name: "trex", password: "pass") }

  it "user is instance of User" do
    user.should be_an_instance_of User
  end

  it "returns user_name when called" do
    user.user_name.should eq("trex")
  end

end 
