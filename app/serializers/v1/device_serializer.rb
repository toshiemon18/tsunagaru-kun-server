class V1::DeviceSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :image
end
