Sequel.seed do
  def run
    if DB && DB[:customers].empty?
      puts "empty customers"
      ["customer 1", "customer 2", "customer 3", "customer 4", "customer 5",
        "customer 6", "customer 7", "customer 8", "customer 9", "customer 10"].each do |seat|
        Customer.create(name: seat)
      end
    end
  end
end 