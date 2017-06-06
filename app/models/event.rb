class Event < ApplicationRecord
  has_many :event_presences

  belongs_to :event_category

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
