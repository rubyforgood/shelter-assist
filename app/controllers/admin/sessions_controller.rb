# frozen_string_literal: true

module Admin
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    def create
      super
      @current_person ||= PresentablePerson.build(resource, view_context)
      after_sign_in_path_for(resource)
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    protected

    def after_sign_in_path_for(_resource)
      people_path
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
