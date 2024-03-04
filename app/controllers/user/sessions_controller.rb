# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    super do |resource|
      if request.format.json?
        render json: {
          jwt: current_token,
          user: { email: resource.email }
        } and return
      end
    end
  end
  def destroy
    super do
      if request.format.json?
        head :no_content and return
      end
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
