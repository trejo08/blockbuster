class Reservation < Sequel::Model
  many_to_one :customer
  many_to_one :movie_day
  many_to_one :movie
  many_to_one :seat

  def validate
    super
    errors.add(:date, "must be present") if date.to_s.empty?
    errors.add(:date, "there is no availability") if check_availability?
  end

  def check_availability?
    mov_id = movie_day.movie.id
    res = false
    if DB[:reservations].where(date: date, movie_id: mov_id).count > 10
      res = true
    # counting = DB[:reservations].where(date: date, movie_id: mov_id, seat_id: seat_id).count
    # puts "counting es: #{counting}"
    # if counting >= 1
    #   res = true
    end
  end

  def before_validation
    self.movie_id = movie_day.movie_id
    super
  end
  
end