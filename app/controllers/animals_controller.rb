# frozen_string_literal: true

class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    respond_to do |format|
      format.html {}
      format.json { render json: animals }
    end
  end

  def create
    animal = Animal.new(animal_params)
    unless animal.save
      response_status = :bad_request
      render :new
    end
    render(json: {
             errors: animal.errors,
             path: animals_path
           })
  end

  def new
    animal = Animal.new

    respond_to do |format|
      format.html {}
      format.json { render json: json_form(animal, new_animal_path, animal.errors) }
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
