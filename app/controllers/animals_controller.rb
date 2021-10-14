class AnimalsController < ApplicationController
  def new
    @animal = Animal.new
  end
end