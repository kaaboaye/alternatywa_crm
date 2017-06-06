class EventCategory < ApplicationRecord
  has_many :events

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
