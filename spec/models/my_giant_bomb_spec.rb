require 'spec_helper'

describe MyGiantBomb do

  before :each do
    @game = MyGiantBomb::Search.specific(13053)
  end

  describe "title of searched gamee" do
    it "returns the correct game title" do
      @game.name.should eql "Final Fantasy VII"
    end
  end

  describe "description" do
    it "returns the correct game description" do
      @game.deck.should eql "A young man's quest to save the world and exact revenge upon the man who wronged him, uncovering dark secrets about his past along the way in the most celebrated console RPG of all time."
    end
  end

end
