class Event < ApplicationRecord
    has_many :event_presences

    belongs_to :event_category
end
