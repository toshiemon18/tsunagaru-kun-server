module V1
  class UsersController < DeviseTokenAuth::RegistrationsController
    before_action :set_user, only: [:show, :update, :destroy]
    # skip_before_action :authenticate_user_from_token!, only: [:create]
    before_action :authenticate_user!


    # GET /users/1
    def show
      render json: current_user, serializer: V1::SessionSerializer
    end

    # PATCH/PUT /users/1
    def update
      @user = current_user
      if @user.update(user_params)
        render json: @user, serializer: V1::SessionSerializer
      else
        render json: {errors: @user.errors.full_messages}, status: 400
      end
    end

    private
      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
  end
end
