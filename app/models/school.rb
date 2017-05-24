class School < ApplicationRecord
  scope :active, -> { where active: true }
  scope :disabled, -> { where active: false }

  has_many :members

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
