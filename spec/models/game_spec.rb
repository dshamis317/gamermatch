require 'spec_helper'

describe Game do

  before :each do
    @game = Game.new(title:"Best Game Ever", description:"It's the best game ever")
  end

  describe "title" do
    it "returns the correct game title" do
      @game.title.should eql "Best Game Ever"
    end
  end

  describe "description" do
    it "returns the correct game description" do
      @game.description.should eql "It's the best game ever"
    end
  end

end
