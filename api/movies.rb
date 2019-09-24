module Blockbuster
  class Movies < Grape::API
    format :json

    resource do
      desc 'Get all movie titles!' do
        detail 'this will expose all the movies'
      end
      params do
        optional :day, type: String, documentation: { param_type: 'json' }
      end
      get :movies do
        list = ListMovies.new
        res = list.call(params[:day]).success
      end
  
      desc 'create a movie' do
        detail 'this will create a new movie'
      end
      params do
        requires :name, type: String, documentation: { param_type: 'query' }
        optional :description, type: String, documentation: { param_type: 'query' }
        optional :image_url, type: String, documentation: { param_type: 'query' }
        requires :days, type: Array, documentation: { param_type: 'query' }
      end
      post :movies do
        data = {
          name: params[:name],
          description: params[:description],
          image_url: params[:image_url],
          movie_days_attributes: params[:days].map{|item| {day: item.to_sym}}
        }
        create_movie = CreateMovie.new
        res = create_movie.call(data)
        res.success.values
      end
    end
  end
end
