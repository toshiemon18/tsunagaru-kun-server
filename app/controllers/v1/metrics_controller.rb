class V1::MetricsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def create
    @metrics = Metric.new(metrics_params)

    if @metrics.save
      render json: @metrics, status: :created, serializer: V1::MetricsSerializer
    else
      render json: @metrics.errors, status: :unprocessable_entity
    end
  end

  private
  # for create method
  def metrics_params
    params.require(:metric).permit(:electric_current, :watt, :device_id, :user_id).merge(user_id: current_user.id)
  end
end
