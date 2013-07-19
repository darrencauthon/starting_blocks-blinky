require 'starting_blocks'
require 'blinky'
require "starting_blocks/blinky/version"

module StartingBlocks
  module Blinky
    StartingBlocks::Publisher.subscribers << StartingBlocks::Extensions::BlinkyLighting.new
  end
end
