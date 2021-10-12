class SignupsController < PasswordlessController
  prepend_before_action :require_no_foster, only: [:new]

  def create
    @foster = Foster.new(foster_params)
    @home = Home.new(foster_params['home'])
    @foster.homes << @home

    if @foster.save
      session = build_passwordless_session(@foster)
      session.token = Passwordless.token_generator.call(session)
      session.save!
      Passwordless::Mailer.magic_link(session).deliver_now
      redirect_to signup_path, notice: 'Check your email for a login link' # change to personal status page
    else
      render :new
    end
  end

  def new
    @foster = Foster.new
  end

  private

  def foster_params
    params.fetch(:foster, {}).permit(
      :full_name,
      :nick_name,
      :email, 
      :phone,
      :street,
      :apt,
      :is_home_during_day,
      :transportation,
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

  def require_no_foster
    redirect_to foster_root_path if current_foster.logged_in?
  end
end
