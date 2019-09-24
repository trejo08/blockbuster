require "dry/transaction"

class ListMovies
  include Dry::Transaction

  step :list

  private
  def list
    res = DB[:movies]
    return Success(res.to_a)
  end
end
