#!/usr/bin/env ruby

argv = ARGV.dup
if argv.include?("-v") || argv.include?("--version")
    require_relative "lib/order/version"
    puts "order #{Order::VERSION}"
    exit 0
end

exit 0