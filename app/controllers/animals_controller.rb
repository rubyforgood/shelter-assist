class AnimalsController < ApplicationController
  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to people_path
    else
      render :new
    end
  end

  def new
    @animal = Animal.new

    respond_to do |format|
      format.html {}
      format.json { render json: json_form(@animal, new_animal_path, @animal.errors) }
    end
  end

  private

  def animal_params
    params.fetch(:animal, {}).permit(
      :name,
      :animal_kind,
      :gender,
      :age,
      :breed,
      :sterilized,
      :microchipped,
      :weight,
      :birthdate
    )
  end
end