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
        list.call.success
      end
  
      desc 'create a movie' do
        detail 'this will create a new movie'
      end
      params do
        requires :name, type: String, documentation: { param_type: 'query' }
        optional :description, type: String, documentation: { param_type: 'query' }
        optional :image_url, type: String, documentation: { param_type: 'query' }
      end
      post :movies do
        data = {
          name: params[:name],
          description: params[:description],
          image_url: params[:image_url]
        }
        create_movie = CreateMovie.new
        res = create_movie.call(data)
        res.success.values
      end
    end
  end
end
