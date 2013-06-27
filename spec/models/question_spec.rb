require 'spec_helper'

describe Question do
  let(:question) { Question.new(title: "Rails", content: "How does it work?") }

  it "question is instance of Question" do
    question.should be_an_instance_of Question
  end

  it "returns title when called" do
    question.title.should eq("Rails")
  end

end 
