require 'sequel'
require 'sequel/extensions/seed'

if ENV['RACK_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load('.env')
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

Sequel.extension :seed
DB = Sequel.connect(ENV['DATABASE_URL'], logger: Logger.new(STDOUT))

Dir[File.expand_path('../../api/*.rb', __FILE__), File.expand_path('../../app/*/*.rb', __FILE__)].each do |f|
  require f
end
puts "==================> current dir: #{__dir__}"
Sequel::Seeder.apply(DB, "#{__dir__}/seeds/")

require 'api'
require 'blockbuster_app'
