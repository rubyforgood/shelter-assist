class SignupsController < PasswordlessController
  prepend_before_action :require_no_person, only: [:new]

  def create
    person = Person.new(person_params)

    response_status = :success

    respond_to do |format|
      format.json do
        if person.save
          session = build_passwordless_session(person)
          session.token = Passwordless.token_generator.call(session)
          session.save!
          Passwordless::Mailer.magic_link(session).deliver_now
          redirect_to confirmation_signup_path 
        else
          response_status = :bad_request
        end
        render(json: {
          person: person,
          errors: person.errors,
          path: confirmation_signup_path
        }, status: response_status)
      end
      format.html { render :new }
    end
  end

  def new
    person = Person.new

    respond_to do |format|
      format.html {}
      format.json { render json: json_form(person, signup_path, person.errors) }
    end
  end

  def confirmation
  end

  private

  def person_params
    params.fetch(:person, {}).permit(
      :full_name,
      :nick_name,
      :email,
      :phone,
      :street,
      :apt,
      :is_home_during_day,
      :transportation,
      animal_kind_preferences_attributes: [:animal_value],
      animal_gender_preferences_attributes: [:animal_value],
      animal_age_preferences_attributes: [:animal_value],
      animal_size_preferences_attributes: [:animal_value],
      homes_attributes: [
        :id,
        :has_children,
        :has_fenced_yard,
        :has_other_adults,
        :has_other_dog,
        :has_other_cat,
        :home_type,
        :street,
        :apt,
        :state,
        :city,
        :zip_code,
      ]
    )
  end

  def require_no_person
    redirect_to person_root_path if current_person.logged_in?
  end
end
