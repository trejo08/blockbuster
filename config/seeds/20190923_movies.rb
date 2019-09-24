Sequel.seed do
  def run
    if DB && DB[:movies].empty?
      puts "empty seats"
      data = [{
        name: "Awesome movie 1",
        description: "Awesome description 1",
        image_url: "https://via.placeholder.com/150",
        movie_days_attributes: [{day: :sunday},{day: :saturday}, {day: :thursday}]
      },{
        name: "Awesome movie 2",
        description: "Awesome description 2",
        image_url: "https://via.placeholder.com/150",
        movie_days_attributes: [{day: :monday},{day: :tuesday}, {day: :friday}]
      },{
        name: "Awesome movie 3",
        description: "Awesome description 3",
        image_url: "https://via.placeholder.com/150",
        movie_days_attributes: [{day: :wednesday},{day: :tuesday}, {day: :sunday}]
      },{
        name: "Awesome movie 4",
        description: "Awesome description 4",
        image_url: "https://via.placeholder.com/150",
        movie_days_attributes: [{day: :monday},{day: :wednesday}, {day: :saturday}]
      },{
        name: "Awesome movie 5",
        description: "Awesome description 5",
        image_url: "https://via.placeholder.com/150",
        movie_days_attributes: [{day: :sunday},{day: :thursday}, {day: :friday}]
      },{
        name: "Awesome movie 6",
        description: "Awesome description 6",
        image_url: "https://via.placeholder.com/150",
        movie_days_attributes: [{day: :friday},{day: :saturday}, {day: :saturday}]
      }]
      data.each do |day|
        Movie.create(day)
      end
    end
  end
end 