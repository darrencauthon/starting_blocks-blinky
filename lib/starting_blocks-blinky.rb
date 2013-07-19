require 'starting_blocks'
require 'blinky'

StartingBlocks::Publisher.subscribers << StartingBlocks::Extensions::BlinkyLighting.new
