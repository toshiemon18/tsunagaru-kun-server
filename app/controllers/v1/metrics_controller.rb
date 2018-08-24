class V1::MetricsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  # GET /metricses
  def index
    @metrices = Metrics.all
  end

  def show
  end

  def create
  end
end
