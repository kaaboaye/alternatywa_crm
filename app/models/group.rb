class Group < ApplicationRecord
  scope :active, -> { where active: true }
  scope :disabled, -> { where active: false }

  has_many :group_presences

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
