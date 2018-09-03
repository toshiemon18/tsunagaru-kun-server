class V1::MetricsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def create
    @metrics = Metric.new(metrics_params)

    if @metric.save
      render json: @metrics, status: :created, serializer: V1::MetricsSerializer
    else
      render json: @metrics.errors, status: :unprocessable_entity
    end
  end

  def show
    @metrics = Metric.where(user_id: current_user.id).where(created_at: (6.month.ago)..Time.now)
    render json: @metrics, serializer: V1::MetricsSerializer
  end

  private
  # for create method
  def metrics_params
    params.require(:metrics).permit(:electric_current, :watt, :device_id).merge(user_id: current_user.id)
  end
end
