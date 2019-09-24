require "dry/transaction"
class CreateMovie
  include Dry::Transaction
  
  step :create

  private

  def create(movie)
    res = Movie.create(movie)
    Success(res)
  end
end