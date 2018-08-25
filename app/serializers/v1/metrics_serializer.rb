class V1::MetricsSerializer < ActiveModel::Serializer
  attributes :id, :electric_current, :voltage, :watt, :watt_hour
end
