class Nightclub < ApplicationRecord
  belongs_to :address

  has_one_attached :photo

  validates_uniqueness_of :name

  def gender_mix
    # calculated or given by number
  end

  def last_updated
    (Time.now - self.updated_at).strftime("%h ")
  end
end
