class SignupsController < ApplicationController
  include Devise::Controllers::SignInOut
  def create
    @foster = Foster.new(foster_params)

    if @foster.save
      session = build_passwordless_session(@foster)
      session.token = Passwordless.token_generator.call(session)
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
      :email, 
      :phone,
      :street,
      :apt,
      :is_home_during_day,
      :transportation
    )
  end
end
