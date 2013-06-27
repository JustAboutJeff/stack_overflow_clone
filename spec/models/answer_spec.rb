require 'spec_helper'

describe Answer do
  let(:answer) { Answer.new(content: "It works by magic") }

  it "answer is instance of Answer" do
    answer.should be_an_instance_of Answer
  end

  it "returns content when called" do
    answer.content.should eq("It works by magic")
  end

end 
