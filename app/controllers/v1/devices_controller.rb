module V1
  class DevicesController < ApplicationController
    before_action :set_device, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    # GET /devices
    def index
      @devices = Device.all

      render json: @devices
    end

    # GET /devices/1
    def show
      render json: @device
    end

    # POST /devices
    def create
      @device = Device.new(device_params)

      if @device.save
        render json: @device, status: :created, location: @device
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /devices/1
    def update
      if @device.update(device_params)
        render json: @device
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end

    # DELETE /devices/1
    def destroy
      @device.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @device = Device.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def device_params
        params.fetch(:device, {:name, :category, :image, :user_id})
      end

      def device_create_params
        params.require(:device).permit(
          :user_id, :name, :category, :image
        ).merge(user_id: current_user.id)
      end
  end
end
