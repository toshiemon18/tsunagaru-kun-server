class V1::DeviceSerializer < ActiveModel::Serializer
  # device attributes
  attributes :id, :name, :category, :image

  # device associations
  has_many :half_year_metrics, serializer: V1::MetricsSerializer

  def half_year_metrics
    Metric.where(created_at: (6.month.ago)..Time.now).order("created_at asc")
  end
end
