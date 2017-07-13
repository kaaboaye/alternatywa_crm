class Recommendation < ApplicationRecord
  belongs_to :member

  validates_associated :member

  validates :note,
    presence: true,
    length: { minimum: 3 }
end
