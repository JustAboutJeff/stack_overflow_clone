require 'spec_helper'

describe Tag do
  let(:tag) { Tag.new(tag_name: "Ruby") }

  it "tag is instance of Tag" do
    tag.should be_an_instance_of Tag
  end

  it "returns tag name when called" do
    tag.tag_name.should eq("Ruby")
  end

end 
