class AnimalsController < ApplicationController
  def new
    @animal = Animal.new

    respond_to do |format|
      format.html {}
      format.json { render json: json_form(@animal, new_animal_path, @animal.errors) }
    end
  end
end