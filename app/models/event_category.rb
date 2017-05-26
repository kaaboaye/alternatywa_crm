class EventCategory < ApplicationRecord
  scope :active, -> { where active: true }
  scope :disabled, -> { where active: false }

  has_many :events
end
