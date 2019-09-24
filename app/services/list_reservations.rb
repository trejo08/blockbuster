require "dry/transaction"

class ListReservations
  include Dry::Transaction

  step :list

  private

  def list(dates)
    res = dates.nil? ? DB[:reservations] : get_reservations(dates[:sdate], dates[:edate])
    Success(res.to_a)
  end

  def get_reservations(start_date, end_date)
    Reservation.where(date: start_date..end_date).map{|item|
      {
        id: item.id,
        customer: item.customer.name,
        movie_name: item.movie_day.movie.name,
        seat: item.seat.name,
        date: item.date,
        week_day: item.movie_day.day
      }
    }
  end
end
