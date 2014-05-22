require 'spec_helper'

describe User do

  before :each do
    @user = User.new(username:"Lichard", email:"lichard@example.com", email_confirmation:"lichard@example.com", age:22, location:"Earth", password:"password", password_confirmation:"password")
  end

  describe "username" do
    it "returns the correct username" do
      @user.username.should eql "Lichard"
    end
  end

  describe "age" do
    it "returns the correct user age" do
      @user.age.should eql 22
    end
  end

  describe "email" do
    it "returns the correct user email" do
      @user.email.should eql "lichard@example.com"
    end
  end

  describe "location" do
    it "returns the correct user location" do
      @user.location.should eql "Earth"
    end
  end

end
