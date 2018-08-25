class V1::MetricsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

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
    params.require(:metrics).permit(:electric_current, :device_id, :recording_time)
  end
end
