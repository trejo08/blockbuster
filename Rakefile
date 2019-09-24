require 'rubygems'
require 'bundler/setup'

require 'rake'

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('../config/environment', __FILE__)
end

task routes: :environment do
  Blockbuster::API.routes.each do |route|
    method = route.request_method.ljust(10)
    path = route.origin
    puts "     #{method} #{path}"
  end
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)


require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/*_test.rb"
end


task default: [:rubocop]
