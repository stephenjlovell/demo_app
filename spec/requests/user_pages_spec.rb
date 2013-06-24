<<<<<<< HEAD
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm Password", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "edit" do
    describe "page" do
      before do
        let(:user) { FactoryGirl.create(:user) }
        sign_in user
        visit edit_user_path(user)
      end
      it { should have_selector('h1',    text: "Update your Profile") }
      it { should have_selector('title', text: "Edit User") }
      it { should have_link('Change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save Changes" }
      it { should have_content('error') }
    end
  end
end
=======
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm Password", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "edit" do
    describe "page" do
      before do
        let(:user) { FactoryGirl.create(:user) }
        sign_in user
        visit edit_user_path(user)
      end
      it { should have_selector('h1',    text: "Update your Profile") }
      it { should have_selector('title', text: "Edit User") }
      it { should have_link('Change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save Changes" }
      it { should have_content('error') }
    end
  end
end
>>>>>>> 39f5529ff7923a3ae5953c04b0afa9dbf7c1bd37
