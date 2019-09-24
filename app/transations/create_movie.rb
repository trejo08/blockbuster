require "dry/transaction"

class CreateUser
  include Dry::Transaction

  step :validate
  step :create

  private

  def validate(input)
    # returns Success(valid_data) or Failure(validation)
  end

  def create(input)
    # returns Success(user)
  end
end
