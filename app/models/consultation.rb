class Consultation < ApplicationRecord
  belongs_to :member

  validates_associated :member
  validates :description,
    allow_blank: true,
    length: { minimum: 3 }
  validates :datetime,
    presence: true
end
