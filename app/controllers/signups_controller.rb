class SignupsController < ApplicationController
  def create
    inputs = params['foster']

    @foster = Foster.new(foster_params)
    @foster.phone = inputs['phone']
    @foster.email = inputs['email']
    @foster.save
  end

  def new
  end

  private

  def foster_params
    params.fetch(:foster, {}).permit(:email, :phone)
  end
end
