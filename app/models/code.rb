class Code < ApplicationRecord
  belongs_to :promotion
  scope :stale, () -> { where(activated: false).where("updated_at < ?", 7.days.ago) }
end
