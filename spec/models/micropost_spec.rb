require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.buiild(content: "lorem ipsum") }

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  its(:user) { should == user }

  describe "when user ID is not present" do
  	before { @micropost = nil }
  	it { should_not be_valid }
  end

  describe "attribute accessibility" do
  	it "should not allow access to user_id" do
	  	expect do
	 	  Micropost.new(user_id: user.id)
	  	end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
	  end
  end

  

end
