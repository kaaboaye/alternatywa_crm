class Event < ApplicationRecord
  scope :active, -> { where active: true }
  scope :disabled, -> { where active: false }

  has_many :event_presences

  belongs_to :event_category
end
