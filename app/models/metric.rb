class Metric < ApplicationRecord
  belongs_to :device

  after_create :set_other_metrics

  private
  def set_other_metrics
    include MetricsEvaluator
    self.watt = watt(self.electric_current)
  end
end
