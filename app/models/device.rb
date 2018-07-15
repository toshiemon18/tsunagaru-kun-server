class Device < ApplicationRecord
  has_many :metrics
  FORMAT_UTF8 = /[\u0000-\u007f]|[\u0080-\u07ff]|[\u0800-\uffff]|[\u{10000}-\u{1ffff}]/u
  validates :name,
            presence: true,
            format: {with: FORMAT_UTF8}
end
