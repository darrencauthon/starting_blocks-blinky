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

  describe "receiving files to run" do

    describe "when there are files to run" do

      let(:files) { [Object.new] }

      it "should change the color to yellow" do
        light.expects(:building!)
        blinky_lighting.receive_files_to_run files
      end

    end

    describe "when there are no files to run" do

      let(:files) { [] }

      it "should do nothing" do
        light.expects(:building!).never
        blinky_lighting.receive_files_to_run files
      end

    end

  end

end
