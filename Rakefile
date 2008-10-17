# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/big_money.rb'

Hoe.new('BigMoney', BigMoney::VERSION) do |p|
  p.developer('Marshall Roch', 'mroch@cmu.edu')
end

# Load extra rake tasks.
tasks_path = File.join(File.dirname(__FILE__), 'rakelib')
rake_files = Dir["#{tasks_path}/*.rake"]
rake_files.each{|rake_file| load rake_file}

# vim: syntax=Ruby
