class SignupsController < ApplicationController
  def create
    inputs = params['foster']

    @foster = Foster.new(foster_params)
    @foster.full_name = inputs['full_name']
    @foster.nick_name = inputs['nick_name']
    @foster.phone = inputs['phone']
    @foster.email = inputs['email']
    @foster.street = inputs['street']
    @foster.apt = inputs['apt']
    @foster.is_home_during_day = inputs['is_home_during_day']
    @foster.save
  end

  def new
  end

  private

  def foster_params
    params.fetch(:foster, {}).permit(:email, :phone, :is_home_during_day)
  end
end
