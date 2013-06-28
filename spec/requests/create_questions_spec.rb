require 'spec_helper'

describe "Use can create questions", :js => true do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question) }

  it "allow user to login" do
    visit login_path
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "Login"
    uri = URI.parse(current_url)
    expect(uri.path).to eq(root_path)
  end

  it "allow user to signup" do
    pending
    # TODO: MAKE THIS TEST PASS
    # visit new_user_path
    # fill_in "user_user_name", :with => user.user_name
    # fill_in "user_email", :with => user.email
    # fill_in "user_password", :with => user.password
    # fill_in "user_password_confirmation", :with => user.password
    # click_button "Sign up"
    # uri = URI.parse(current_url)
    # expect(uri.path).to eq(user_path(user.id))
  end

  it "allows user profile edit" do
    pending
    # TODO: MAKE THIS TEST PASS
    # visit users_path
    # click_link "Edit"
    # fill_in "user_user_name", :with => "Franz"
    # fill_in "user_email", :with => "Franz@Franzy.com"
    # click_button 'Save Changes'
    # expect(page).to have_content "Franz"
    # expect(page).to have_content "Franz@Franzy.com"
  end

  it "allows a user to post a question" do
    pending
    # TODO: MAKE THIS TEST PASS
    # visit root_path
    # click_link "Add New Question"
    # fill_in "question_title", :with => question.title
    # fill_in "question_content", :with => question.content
    # click_button "Create Question"
    # expect(page).to have_content question.title
  end
end
