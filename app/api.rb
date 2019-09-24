module Blockbuster
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::Blockbuster::Movies
    mount ::Blockbuster::Reservations
    add_swagger_documentation api_version: 'v1'
  end
end
