require "dry/transaction"
class CreateReservation
  include Dry::Transaction
  
  step :create

  private

  def create(reservation)
    mov = MovieDay[reservation[:movie_day_id]].movie_id
    counting = DB[:reservations].where(date: reservation[:date],
                                       movie_id: mov,
                                       seat_id: reservation[:seat_id]).count
    if counting > 0
      errors = {
        seat: "seat is not available"
      }
    end
    res = errors.nil? ? Reservation.create(reservation) : errors
    puts res.inspect
    Success(res)
  end
end