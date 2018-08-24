class V1::MetricsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  # GET /metricses
  def index
  end

  def show
  end

  def create
  end

  private
  # for create method
  def metrics_params
  end

  # for show method
  def show_metrics_params
    params.require(:metrics).permit(:device_id, :start_at, :end_at)
  end
end
