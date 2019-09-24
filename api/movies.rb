module Blockbuster
  class Movies < Grape::API
    format :json

    resource do
      desc 'Get all movie titles!' do
        detail 'this will expose all the movies'
      end
      params do
        optional :week_day, type: String, documentation: { param_type: 'query' }
      end
      get :movies do
        res = DB[:movies]
        puts "res: #{res}"
        Movie.each do |m|
          puts "First Movie=====================>: #{Movie[1].name}"
        end

        res.to_a
      end
  
      desc 'create a movie' do
        detail 'this will create a new movie'
      end
      params do
        requires :name, type: String, documentation: { param_type: 'query' }
        optional :description, type: String, documentation: { param_type: 'query' }
        optional :image, type: Rack::Multipart::UploadedFile, documentation: { param_type: 'query' }
      end
      post :movies do
        if !params[:name].empty?
          res = Movie.create(name: params[:name], description: params[:description])
        end
        res.to_json
      end
    end
  end
end
