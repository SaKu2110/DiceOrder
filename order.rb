#!/usr/bin/env ruby
require 'optparse'
require_relative "lib/order/dialogue"
require_relative "lib/order/display"

argv = ARGV.dup
if argv.include?("-v") || argv.include?("--version")
    require_relative "lib/order/version"
    puts "order #{Order::VERSION}"
    exit 0
end

begin
    jsonData = JSON.load(File.open("config/dice_order.json"))
    unless jsonData then
        # Jsonファイルの読み込みに失敗
        raise "Failed to load Json file."
    end

    @options = {}

    # 被験者のグループ番号
    Order.showGroups(jsonData)
    Order.setGroup(@options)
    Order.diceCount(@options)

    Order.showPattern(@options, jsonData)
    exit 0
rescue => e
    puts e.message
    exit 1
end