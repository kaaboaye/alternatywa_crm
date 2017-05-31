class GroupPresence < ApplicationRecord
  scope :active, -> { where active: true }
  scope :disabled, -> { where active: false }

  belongs_to :group
  belongs_to :member

  validates_associated :group
  validates_associated :member

  validates :datetime,
    presence: true
end
