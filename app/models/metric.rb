class Metric < ApplicationRecord
  belongs_to :device

  scope :mine, -> (user_id) { where(user_id: user_id) }
  scope :order_by_created_at_desc, -> { order("created_at desc") }
  scope :half_year, -> { where(created_at: (6.month.ago)..Time.now) }

  before_create { self.voltage = 100.0 }

  def half_year_records
    self.half_year.order_by_created_at_desc
  end
end
