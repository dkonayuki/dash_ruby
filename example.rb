#!/usr/bin/env ruby

require 'dash_ruby'

button = Dash::Button.new('08:00:27:53:b1:36', 'eth0')
button.on_pressed do |packet|
  puts packet.inspect
  #puts packet.to_s
end
