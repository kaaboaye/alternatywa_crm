class EventPresence < ApplicationRecord
  belongs_to :event
  belongs_to :member

  validates_associated :event
  validates_associated :member

  validates :time,
    presence: true
end
