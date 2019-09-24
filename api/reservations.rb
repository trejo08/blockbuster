module Blockbuster
  class Reservations < Grape::API
    format :json

    resource do
      desc 'Get all movie titles!' do
        detail 'this will expose all the movies'
      end
      params do
        optional :sdate, type: String, documentation: { param_type: 'json' }
        optional :edate, type: String, documentation: { param_type: 'json' }
      end
      get :reservations do
        data = {
          sdate: params[:sdate],
          edate: params[:edate]
        }
        list = ListReservations.new
        res = list.call(data).success
      end
  
      desc 'create a reservation' do
        detail 'this will create a new reservation'
      end
      params do
        requires :date, type: String, documentation: { param_type: 'query' }
        requires :customer_id, type: Integer, documentation: { param_type: 'query' }
        requires :movie_day_id, type: Integer, documentation: { param_type: 'query' }
        requires :seat_id, type: Integer, documentation: { param_type: 'query' }
      end
      post :reservations do
        data = {
          date: params[:date],
          customer_id: params[:customer_id],
          movie_day_id: params[:movie_day_id],
          seat_id: params[:seat_id]
        }
        create_reservation = CreateReservation.new
        res = create_reservation.call(data)
        res.success.values
      end
    end
  end
end
