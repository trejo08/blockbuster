require 'sequel'

if ENV['RACK_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load('.env')
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

DB = Sequel.connect(ENV['DATABASE_URL'], logger: Logger.new(STDOUT))
Dir[File.expand_path('../../api/*.rb', __FILE__), File.expand_path('../../app/*/*.rb', __FILE__)].each do |f|
  require f
end

require 'api'
require 'blockbuster_app'
