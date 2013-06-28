require 'spec_helper'

describe "User can create questions" do

  it "allow user to login" do
    login
    uri = URI.parse(current_url)
    expect(uri.path).to eq(root_path)
  end

  it "allow user to signup" do
    visit new_user_path
    fill_in "user_user_name", :with => "niles"
    fill_in "user_email", :with => "niles@niles.com"
    fill_in "user_password", :with => "123456"
    fill_in "user_password_confirmation", :with => "123456"
    click_button "Sign up"
    expect(page).to have_content "niles"
  end

  it "allows user profile edit" do
    user = login
    visit user_path(user)
    click_link "Edit"
    fill_in "user_user_name", :with => "Franz"
    fill_in "user_email", :with => "Franz@Franzy.com"
    click_button 'Save Changes'
    expect(page).to have_content "Franz"
    expect(page).to have_content "Franz@Franzy.com"
  end

  it "allows a user to post a question" do
    login
    click_link "Add New Question"
    fill_in "question_title", :with => "Strange Facts from Beyond"
    fill_in "question_content", :with => "Science ipsum. Entropy thus"
    click_button "Create Question"
    expect(page).to have_content "Science"
  end
end
