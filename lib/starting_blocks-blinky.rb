require 'starting_blocks'
require 'blinky'
require "starting_blocks-blinky/version"

StartingBlocks::Publisher.subscribers << StartingBlocks::Extensions::BlinkyLighting.new
