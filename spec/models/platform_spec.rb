require 'spec_helper'

describe Platform do

  before :each do
    @platform = Platform.new(platform_name:"PlayStation 4")
  end

  describe "platform name" do
    it "returns the correct platform name" do
      @platform.platform_name.should eql "PlayStation 4"
    end
  end

end
