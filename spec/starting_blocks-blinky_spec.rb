require_relative 'minitest_helper'

describe "blinky lighting" do

  let(:blinky_lighting) { StartingBlocks::Extensions::BlinkyLighting.new }

  let(:light) { Object.new }

  before do
    blinky = Object.new
    Blinky.stubs(:new).returns blinky
    blinky.stubs(:light).returns light
  end

  describe "turn off" do

    it "should turn off the blinky light" do
      light.expects(:off!)
      StartingBlocks::Extensions::BlinkyLighting.turn_off!
    end

  end

end
