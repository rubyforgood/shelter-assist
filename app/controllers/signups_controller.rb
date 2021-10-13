class SignupsController < PasswordlessController
  prepend_before_action :require_no_person, only: [:new]

  def create
    @person = Person.new(person_params)
    @home = Home.new(person_params['home'])
    @person.homes << @home

    if @person.save
      session = build_passwordless_session(@person)
      session.token = Passwordless.token_generator.call(session)
      session.save!
      Passwordless::Mailer.magic_link(session).deliver_now
      redirect_to signup_path, notice: 'Check your email for a login link' # change to personal status page
    else
      render :new
    end
  end

  def new
    @person = Person.new
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
      :from,
      :extra_availability_info,
      homes_attributes: [
        :id,
        :has_children,
        :has_fenced_yard,
        :has_other_adults,
        :has_other_dog,
        :has_other_cat
      ]
    )
  end

  def require_no_person
    redirect_to person_root_path if current_person.logged_in?
  end
end
