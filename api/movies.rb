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
        list = ListMovies.new
        list.call
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
          res = Movie.create(name: params[:name], description: params[:description], image_url: params[:image])
        end
        res.to_json
      end
    end
  end
end
