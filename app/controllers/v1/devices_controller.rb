module V1
  class DevicesController < ApplicationController
    before_action :set_device, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    # GET /devices
    def index
      @devices = Device.all

      render json: @devices, each_serializer: V1::DeviceSerializer
    end

    # GET /devices/1
    def show
      @metrics = Metric.mine(current_user.id).where(device_id: @device.id).half_year.order_by_created_at_desc
      render json: @device, serializer: V1::DeviceSerializer
    end

    # POST /devices
    def create
      @device = Device.new(device_params)

      if @device.save
        render json: @device, status: :created, serializer: V1::DeviceSerializer
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /devices/1
    def update
      if @device.update(device_params)
        render json: @device, serializer: V1::DeviceSerializer
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
        @device = Device.mine(current_user.id).find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def device_params
        params.require(:device).permit(:id, :name, :category, :image, :user_id).merge(user_id: current_user.id)
      end
  end
end
