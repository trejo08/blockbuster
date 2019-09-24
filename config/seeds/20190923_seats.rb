Sequel.seed do
  def run
    if DB && DB[:seats].empty?
      puts "empty seats"
      ["number 1", "number 2", "number 3", "number 4", "number 5",
        "number 6", "number 7", "number 8", "number 9", "number 10"].each do |seat|
        Seat.create(name: seat)
      end
    end
  end
end 