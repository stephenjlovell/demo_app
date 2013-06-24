<<<<<<< HEAD
require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "sign in" do

    before { visit signin_path }
    it { should have_selector('h1', text: 'Sign In') }
    it { should have_selector('title', text: 'Sign In') }

    describe "sign in" do

      describe "with invalid information" do

        before { click_button "Sign In" }
        it { should have_selector 'div.alert.alert-error', text: 'Invalid' }

        describe "after visiting another page" do
          before { click_link "Home" }
          it { should_not have_selector('div.alert.alert-error') }
        end
      end

      
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile',  href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
      end
    end
  end

  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign In') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end
  end




=======
require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "sign in" do

    before { visit signin_path }
    it { should have_selector('h1', text: 'Sign In') }
    it { should have_selector('title', text: 'Sign In') }

    describe "sign in" do

      describe "with invalid information" do

        before { click_button "Sign In" }
        it { should have_selector 'div.alert.alert-error', text: 'Invalid' }

        describe "after visiting another page" do
          before { click_link "Home" }
          it { should_not have_selector('div.alert.alert-error') }
        end
      end

      
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile',  href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
      end
    end
  end

  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign In') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end
  end




>>>>>>> 39f5529ff7923a3ae5953c04b0afa9dbf7c1bd37
end