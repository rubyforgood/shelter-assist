class DogsController < ApplicationController

  def index
    @dogs = fetch_mock_dog_data
  end

  private

  #
  # Returns an array of mock dog data
  # @return [Array]
  def fetch_mock_dog_data
    names = [ "Bella", "Buddy", "Buster", "Cali", "Charlie", "Max", "Oliver", "Oscar", "Penny", "Riley", "Shadow", "Sophie", "Toby", "Tucker", "Winston" ]
    ages = [ 'Puppy', 'Adult', 'Senior' ]
    breeds = [ 'Labrador', 'Poodle', 'German Shepherd', 'Golden Retriever', 'Pug' ]
    weights = [ 'Small', 'Medium', 'Large' ]
    sexs = [ 'Male', 'Female' ]

    12.times.map do |i|
      name = names.sample
      age = ages.sample
      breed = breeds.sample
      weight = weights.sample
      sex = sexs.sample

      dog_photo = "https://placedog.net/500/280?id=#{rand(1..100)}"
      OpenStruct.new(image_src: dog_photo, name: name, age: age, breed: breed, weight: weight, sex: sex)
    end
  end

end 
