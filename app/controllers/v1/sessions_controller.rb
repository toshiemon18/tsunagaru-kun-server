module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    # POST /v1/login
    def create
      @user = User.find_for_database_authentication(email: params[:email])
      return invalid_email unless @user
      if @user.valid_password?(params[:password])
        sign_in :user, @user
        render json: @user, serializer: V1::SessionSerializer, root: nil
      else
        invalid_password
      end
    end

    private

    def invalid_email
      warden.custom_failure!
      render json: { error: "Invalid email" }
    end

    def invalid_password
      warden.custom_failure!
      render json: { error: "Invalid password" }
    end

    def session_params
      params.require(:user).permit(:email, :password)
    end
  end
end