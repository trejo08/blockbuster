require "dry/transaction"

class ListMovies
  include Dry::Transaction

  step :list

  private
  def list
    res = DB[:movies]
    return Sucess(res) || Failure(res)
  end
end
