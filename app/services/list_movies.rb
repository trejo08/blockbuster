require "dry/transaction"

class ListMovies
  include Dry::Transaction
  DAYS = { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7 }

  step :list

  private

  def list(day)
    res = day.nil? ? DB[:movies] : MovieDay.association_join(:movie).where(day: DAYS[day.to_sym]).map{
      |item| item.movie.values
    }
    puts "response: #{res.inspect}"
    return Success(res.to_a)
  end
end
