class Contract < ApplicationRecord
  belongs_to :member

  validates_associated :member
  validates :number,
    presence: true

  scope :active, -> { where(:since < Time.now).where(:finish > Time.now) }

  def active
    now = Time.now
    since < now && finish > now
  end
end
