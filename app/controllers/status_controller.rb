class StatusController < PasswordlessController
  before_action :require_person!
  def show
    @person = Person.includes(
      :homes,
      :animal_age_preferences,
      :animal_gender_preferences,
      :animal_kind_preferences,
      :animal_size_preferences
    ).find_by(id: current_person.id)

    respond_to do |format|
      format.html {}
      format.json { render json: {
        person: @person,
        homes: @person.homes,
        animal_age_preferences: @person.animal_age_preferences,
        animal_gender_preferences: @person.animal_gender_preferences,
        animal_kind_preferences: @person.animal_kind_preferences,
        animal_size_preferences: @person.animal_size_preferences,
      } }
    end
  end
end
