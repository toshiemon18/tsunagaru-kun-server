class V1::MetricsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def index
    @metrics = Metric.mine(current_user.id).where(device_id: params[:device_id]).half_year.order_by_created_at_desc
    render json: @metrics, serializer: V1::MetricsSerializer
  end

  def create
    @metrics = Metric.new(metrics_params)

    if @metric.save
      render json: @metrics, status: :created, serializer: V1::MetricsSerializer
    else
      render json: @metrics.errors, status: :unprocessable_entity
    end
  end

  private
  # for create method
  def metrics_params
    params.require(:metrics).permit(:electric_current, :watt, :device_id).merge(user_id: current_user.id)
  end
end
