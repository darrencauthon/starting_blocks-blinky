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

  describe "receiving results" do

    let(:results) { {} }

    describe "no files were received" do

      before do
        blinky_lighting.receive_files_to_run []
      end

      it "should do nothing" do
        light.expects(:success!).never
        light.expects(:failure!).never
        light.expects(:building!).never

        blinky_lighting.receive_results results
          
      end

    end

    describe "files were received previously" do

      before do
        blinky_lighting.receive_files_to_run [Object.new]
      end

      describe "different colored results" do

        [
          [:green,  :success!],
          [:red,    :failure!],
          [:yellow, :building!],
        ].map { |x| Struct.new(:color, :light_method).new(*x) }.each do |example|

          describe "and the color is #{example.color}" do

            before { results[:color] = example.color }

            it "should call #{example.light_method}" do
                
              light.expects example.light_method
              blinky_lighting.receive_results results

            end

          end

          describe "but no color was provided" do

            before { results[:color] = nil }

            it "should use the old logic that will be removed eventually" do
              blinky_lighting.expects(:run_the_old_logic_with).with results
              blinky_lighting.receive_results results
            end

          end

        end

      end
      describe "and color on the results is green" do



      end

    end

  end

end
