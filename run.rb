#! /usr/bin/ruby
# frozen_string_literal: true

port = Dir.glob('/dev/tty.wchusbserial*')[0]

unless port
  puts 'Oops! Soulmate expects an ESP32 at /dev/tty.wchusbserial*.'
  puts 'Check the docs for more info.'
  exit
end

result = system "ESPPORT=#{port} make flash"

if !result
  puts 'Your Soulmate is now online. Open your app to control it!'
else
  puts 'Oops - something went wrong!'
end
