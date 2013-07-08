require 'starting_blocks'
require 'blinky'
require "starting_blocks/blinky/version"

module StartingBlocks
  module Blinky
  end
end

class GreenOnSuccessRedOnFailure
  def receive_results results
    if (results[:errors] || 0) > 0
      Blinky.new.light.failure!
    elsif (results[:failures] || 0) > 0
      Blinky.new.light.failure!
    elsif (results[:skips] || 0) > 0
      Blinky.new.light.building!
    else
      Blinky.new.light.success!
    end
  end
end
StartingBlocks::Publisher.subscribers << [GreenOnSuccessRedOnFailure.new]

at_exit do
  sleep(0.5)
  Blinky.new.light.off!
end
