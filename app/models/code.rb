class Code < ApplicationRecord
  belongs_to :promotion
  scope :stale, -> { where(activated: false).where("updated_at < ?", 7.days.ago) }

  after_create :generate_code

  def generate_code
    code = id.to_s + ('A'..'Z').to_a.shuffle[0,3].join
    update(code: code)
  end
end
