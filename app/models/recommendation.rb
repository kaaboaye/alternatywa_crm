class Recommendation < ApplicationRecord
  belongs_to :member

  validates_associated :member

  validates :note,
    presence: true,
    length: { minimum: 3 }

  scope :short, -> { select "`id`, `member_id`, substr(note, 1, 50) AS note" }
end
