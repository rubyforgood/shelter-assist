# frozen_string_literal: true

class StatusController < PasswordlessController
  before_action :require_person!
  def show
    respond_to do |format|
      format.html {}
      format.json do
        render json: {
          person: current_person,
          homes: current_person.homes,
          animal_age_preferences: current_person.animal_age_preferences,
          animal_gender_preferences: current_person.animal_gender_preferences,
          animal_kind_preferences: current_person.animal_kind_preferences,
          animal_size_preferences: current_person.animal_size_preferences
        }
      end
    end
  end
end
